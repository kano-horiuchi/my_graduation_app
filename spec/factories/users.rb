FactoryBot.define do
    factory :user do
        name { "テストユーザー" }
        email { "sake@example.com" }
        password { "password" }
        password_confirmation { "password" }
    end
end
