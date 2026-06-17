require 'rails_helper'

RSpec.describe "Admin::Access", type: :request do
    let(:general_user) { create(:user, role: :general) }
    before do
        post login_path, params: { email: general_user.email, password: 'password' }
    end

    it "一般ユーザーは管理画面にアクセスできないこと" do
        get admin_root_path
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to be_present
    end
end
