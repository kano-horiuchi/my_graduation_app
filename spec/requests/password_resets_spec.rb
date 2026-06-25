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

  describe "POST /create" do
    let(:user) { create(:user) }

    it "メール送信メソッドが呼び出されること" do
      mail_double = instance_double(ActionMailer::MessageDelivery)
      expect(UserMailer).to receive(:reset_password_email).with(anything).and_return(mail_double)
      expect(mail_double).to receive(:deliver_now)
      post password_resets_path, params: { email: user.email }
      expect(response).to redirect_to(root_path)
    end
  end
end
