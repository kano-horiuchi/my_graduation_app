FactoryBot.define do
    factory :user do
        name { "テストユーザー" }
        sequence(:email) { |n| "user#{n}@example.com" }
        password { "password" }
        password_confirmation { "password" }
        role { :general }
        trait :owner do
            role { :owner }
        end
    end
end
