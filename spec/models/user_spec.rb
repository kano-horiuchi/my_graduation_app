require 'rails_helper'

RSpec.describe User, type: :model do
    describe "バリデーションテスト" do
        it "ニックネーム、メール、パスワードがあれば有効であること" do
            user = build(:user)
            expect(user).to be_valid
        end

        it "メールアドレスが重複していたら無効であること" do
            create(:user, email: "test@example.com")
            user = build(:user, email: "test@example.com")
            expect(user).not_to be_valid
        end

        it "ニックネームがなければ無効であること" do
            user = build(:user, name: nil)
            expect(user).not_to be_valid
        end
    end
end
