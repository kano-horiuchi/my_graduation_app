class BoardsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  before_action :set_my_board, only: %i[edit update destroy]

  def index
    @q = Board.ransack(params[:q])
    @boards = @q.result(distinct: true)
    if params[:q] && params[:q][:with_all_tags].present?
      @boards = @boards.with_all_tags(params[:q][:with_all_tags])
    end
    @boards = @boards.includes(:user, :tags).order(created_at: :desc)
  end

  def show
    @board = Board.find(params[:id])
    Rails.logger.info "=== Board Image Debug ==="
    Rails.logger.info "Board ID: #{@board.id}"
    Rails.logger.info "board_image present?: #{@board.board_image?}"
    Rails.logger.info "board_image.url: #{@board.board_image.url if @board.board_image?}"
    Rails.logger.info "========================="
  end

  def edit
  end

  def update
    delete_ids = params[:board][:delete_image_ids]&.map(&:to_i) || []
    if delete_ids.present?
      remain_images = @board.board_images.each_with_index.reject { |_, index| delete_ids.include?(index) }.map(&:first)
      @board.board_images = remain_images
      @board.save if @board.board_images_changed?
    end

    new_images = board_params[:board_images]
    if new_images.present?
      @board.board_images += new_images
    end

    if @board.update(board_params.except(:board_images))
      redirect_to board_path(@board), success: t("defaults.update.success"), status: :see_other
    else
      flash.now[:danger] = t("defaults.message.not_updated")
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path, flash: { success: t("boards.create.success") }, status: :see_other
    else
      flash.now[:danger] = t("boards.create.fail")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @board = current_user.boards.find(params[:id])
    @board.destroy!
    redirect_to boards_path, success: t("defaults.message.deleted"), status: :see_other
  end

  def search
    @q = Board.ransack(params[:q])
    @boards = @q.result(distinct: true).includes(:user, :tags).order(created_at: :desc)
  end

  def autocomplete
    titles = Board.where("title ILIKE ?", "%#{params[:term]}%").distinct.limit(5).pluck(:title)
    render json: titles
  end

  def favorites
    @q = current_user.favorite_boards.ransack(params[:q])
    @boards = @q.result(distinct: true).includes(:user, :tags).order(created_at: :desc)
  end

  private

  def set_my_board
    @board = current_user.boards.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title, :body, tag_ids: [], board_images: [])
  end
end
