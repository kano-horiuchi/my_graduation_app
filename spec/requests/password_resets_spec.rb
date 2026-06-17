require 'rails_helper'

RSpec.describe "PasswordResets", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/password_resets/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      user = create(:user)
      user.generate_reset_password_token!
      get edit_password_reset_path(user.reset_password_token)
      expect(response).to have_http_status(:success)
    end
  end
end
