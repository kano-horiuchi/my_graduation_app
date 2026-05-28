class Admin::BaseController < ApplicationController
    before_action :require_login
    before_action :check_admin
    layout "admin"

    private

    def not_authenticated
        redirect_to login_path, alert: "ログインしてください"
    end

    def check_admin
        unless current_user.owner?
            redirect_to root_path, alert: "管理者権限がありません"
        end
    end
end
