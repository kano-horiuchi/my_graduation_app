class MypagesController < ApplicationController
  def show
    @boards = current_user.boards.order(created_at: :desc)
  end
end
