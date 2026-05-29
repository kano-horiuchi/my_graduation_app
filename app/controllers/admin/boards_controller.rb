class Admin::BoardsController < Admin::BaseController
    def index
        @boards = Board.all.includes(:user, :tags).order(created_at: :desc)
    end

    def destroy
        @board = Board.find(params[:id])
        @board.destroy!
        redirect_to admin_boards_path, success: "削除しました"
    end
end
