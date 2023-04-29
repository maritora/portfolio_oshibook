FactoryBot.define do
  factory :profile do
    oshi_name { "テスト太郎" }
    call { "テスト" }
    reason { "テスト" }
    every { "テスト" }
    future { "テスト" }
    job { "テスト" }
    favorite_point { "テスト" }
    free { "テスト" }
    user_id { "テスト" }
    is_published_flag { true }
    color { "#000000" }
    sns { "test@test.com" }
    user
  end
end