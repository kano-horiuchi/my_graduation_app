class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def edit
  end

  def update
    if @user.update(user_params)
      if request.referer&.include?("boards/search")
        flash[:success] = t("profiles.update.advise")
      else
        flash[:success] = t("profiles.update.success")
      end
      redirect_to request.referer || mypage_path
    else
      flash.now[:danger] =t("profiles.update.fail")
      if request.referer&.include?("edit")
        render :edit, status: :unprocessable_entity
      else
        redirect_to request.referer || mypage_path, status: :unprocessable_entity
      end
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :name, :fruity_level, :rich_level, :dry_level)
  end
end
