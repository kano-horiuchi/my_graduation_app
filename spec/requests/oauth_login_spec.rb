require 'rails_helper'

RSpec.describe "OAuthログイン", type: :request do
  let(:user) { create(:user, email: 'test@example.com') }

  before do
    allow_any_instance_of(OauthsController).to receive(:login_from).and_return(user)
  end

  it "Google認証でログインできること" do
    get "/oauth/callback/google"
    expect(response).to redirect_to(root_path)
    follow_redirect!
    expect(response.body).to include("ログインしました")
  end
end
