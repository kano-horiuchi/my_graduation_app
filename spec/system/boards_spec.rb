require 'rails_helper'

RSpec.describe "投稿機能", type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:tag) { create(:tag) }
  let!(:board) { create(:board, user: user) }
  let!(:other_board) { create(:board, user: other_user) }

  before do
    visit login_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: "password"
    click_button "ログイン"
    expect(page).to have_content "ログインしました"
  end

  it "新規投稿ができること" do
    visit new_board_path
    expect(page).to have_content "日本酒を記録する"

    find('input[name="board[title]"]').set("日本酒")
    find("label", text: tag.name).click
    fill_in "メモ", with: "メモ"
    click_button "記録する"
    expect(page).to have_content "日本酒を記録しました"
  end

  describe "投稿の編集と削除" do
    it "自分の投稿には編集・削除ボタンが表示されること" do
      visit board_path(board)
      expect(page).to have_content board.title
      expect(page).to have_selector('.btn-delete', wait: 5)
      expect(page).to have_link "編集する"
    end

    it "他の人の投稿には編集・削除ボタンが表示されないこと" do
      visit board_path(other_board)
      expect(page).to have_content other_board.title
      expect(page).not_to have_selector '.btn-delete'
      expect(page).not_to have_link "編集する"
    end

    it "投稿を編集できること" do
      visit edit_board_path(board)
      expect(page).to have_field("board_title")
      expect(page).to have_content "記録の編集"
      find("#board_title").set("編集後のタイトル")
      find("#board_body").set("編集後のメモ")
      click_button "更新"
      expect(page).to have_content "記録を更新しました"
    end

    it "投稿を削除できること" do
      visit board_path(board)
      expect(page).to have_content board.title
      accept_confirm do
        click_button "削除"
      end
      expect(page).to have_content "記録を削除しました"
    end

    it "他人の投稿は削除できないこと" do
        visit board_path(other_board)
        expect(page).not_to have_button "削除"
    end
  end
end
