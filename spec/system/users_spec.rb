require 'rails_helper'

RSpec.describe "ユーザー登録", type: :system do
  it "有効な情報でユーザー登録ができること" do
    visit new_user_path

    fill_in "ニックネーム", with: "テストユーザー"
    fill_in "メールアドレス", with: "sake@example.com"
    fill_in "パスワード", with: "password"
    fill_in "パスワード確認", with: "password"

    click_button "登録"

    expect(page).to have_content "ユーザー登録が完了しました"
    expect(current_path).to eq login_path
  end
end
