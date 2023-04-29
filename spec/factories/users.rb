FactoryBot.define do
  factory :user do
    email { "test@test.com" }
    password { "password" }
    name { "テスト" }
  end
end
