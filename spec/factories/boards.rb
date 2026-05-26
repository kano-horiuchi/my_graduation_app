FactoryBot.define do
  factory :board do
    title { "テスト" }
    body { "テスト本文" }
    association :user
    after(:build) do |board|
      board.tags << (Tag.first || create(:tag))
    end
  end
end
