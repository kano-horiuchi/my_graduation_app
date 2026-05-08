class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = t("profiles.update.success")
      redirect_to mypage_path
    else
      flash.now[:danger] =t("profiles.update.fail")
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
