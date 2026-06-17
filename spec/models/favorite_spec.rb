require 'rails_helper'

RSpec.describe Favorite, type: :model do
    let(:user) { create(:user) }
    let(:board) { create(:board) }

    it "お気に入り登録できること" do
        expect {
            user.favorite(board)
        }.to change(Favorite, :count).by(1)
    end

    it "お気に入り解除できること" do
        user.favorite(board)
        expect {
            user.unfavorite(board)
        }.to change(Favorite, :count).by(-1)
    end
end
