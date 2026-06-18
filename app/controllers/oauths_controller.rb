class OauthsController < ApplicationController
  skip_before_action :require_login, raise: false
  include Sorcery::Controller

  def oauth
    login_at(:google)
  end

  def callback
    provider = :google
    if (@user = login_from(provider))
      auto_login(@user)
      redirect_to root_path, notice: "ログインしました"
    else
      user_info = @user_hash[:user_info]
      @user = User.new(
        email: user_info["email"],
        name: (user_info["name"] || "Googleユーザー")
      )
      @user.skip_password_validation = true
      if @user.save
        @user.authentications.create!(provider: provider, uid: @user_hash[:uid])
        reset_session
        auto_login(@user)
        redirect_to root_path, notice: "登録してログインしました"
      else
        Rails.logger.error "保存エラー内容: #{@user.errors.full_messages}"
        redirect_to root_path, alert: "登録できません: #{@user.errors.full_messages.join(', ')}"
      end
    end
  end
end
