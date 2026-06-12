class OauthsController < ApplicationController
  skip_before_action :require_login
  def oauth
    login_at(:google)
  end

  def callback
    provider = :google
    if (@user = login_from(provider))
      redirect_to root_path, notice: "ログインしました"
    else
      begin
        @user = create_from(provider)
        if @user&.persisted?
          reset_session
          auto_login(@user)
          redirect_to root_path, notice: "登録してログインしました"
        else
          redirect_to root_path, alert: "ログインに失敗しました: ユーザー情報の取得に失敗しました"
        end
      rescue => e
        Rails.logger.error "Google OAuth Error: #{e.message}"
        redirect_to root_path, alert: "ログインに失敗しました"
      end
    end
  end
end
