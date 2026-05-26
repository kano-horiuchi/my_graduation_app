require 'rails_helper'

RSpec.describe "投稿機能", type: :system do
  let(:user) { create(:user) }
  let!(:tag) { create(:tag) }

  before do
    visit login_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: "password"
    click_button "ログイン"
    expect(page).to have_content("ログインしました")
  end

  it "新規投稿ができること" do
    visit new_board_path
    find('input[name="board[title]"]').set("日本酒")
    find("label", text: tag.name).click
    find('textarea[name="board[body]"]').set("メモ")
    click_button "記録する"
    expect(page).to have_content "日本酒を記録しました"
  end

  describe "掲示板の編集と削除" do
    let!(:board) { create(:board, user: user) }
    it "掲示板を編集できること" do
      visit edit_board_path(board)
      find('input[name="board[title]"]').set("編集後のタイトル")
      find('textarea[name="board[body]"]').set("編集後のメモ")
      click_button "更新"
      expect(page).to have_content "記録を更新しました"
    end

    it "投稿を削除できること" do
      visit board_path(board)
      accept_confirm do
        click_button "削除"
      end

      expect(page).to have_content "記録を削除しました"
    end
  end
end
