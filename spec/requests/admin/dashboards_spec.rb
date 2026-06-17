require 'rails_helper'

RSpec.describe "Admin::Dashboards", type: :request do
  let(:owner_user) { create(:user, :owner) }
  before do
    post login_path, params: { email: owner_user.email, password: 'password' }
  end
  describe "GET /index" do
    it "returns http success" do
      get admin_root_path
      expect(response).to have_http_status(:success)
    end
  end
end
