require 'rails_helper'

RSpec.describe "ログイン機能", type: :system do
    let(:user) { create(:user) }

    it "正しい情報でログインできること" do
        visit login_path
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: "password"
        click_button "ログイン"

        expect(page).to have_content("ログインしました")
    end
end
