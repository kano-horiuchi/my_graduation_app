class FavoritesController < ApplicationController
    before_action :require_login

    def create
        @board = Board.find(params[:board_id])
        current_user.favorite_boards << @board

        respond_to do |format|
            format.turbo_stream
            format.html { redirect_to request.referer || boards_path }
        end
    end

    def destroy
        @board = Board.find(params[:board_id])
        current_user.favorite_boards.delete(@board)

        respond_to do |format|
            format.turbo_stream
            format.html { redirect_to request.referer || boards_path }
        end
    end
end
