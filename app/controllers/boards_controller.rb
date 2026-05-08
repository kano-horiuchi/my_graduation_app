class BoardsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  def index
    @boards = Board.all.includes(:user).order(created_at: :desc)
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to board_path(@board), success: t("defaults.message.updated")
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
      redirect_to boards_path, flash: { success: t("boards.create.success") }
    else
      flash.now[:danger] = t("boards.create.fail")
      render :new, status: :unprocessable_entity
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :body, tag_ids: [])
  end
end
