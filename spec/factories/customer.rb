FactoryBot.define do
  factory :customer do
    name { "テスト太郎" }
    phone_number { "00000000000" }
    postcode { "1234567" } # 7桁の数字
    address { "テスト県テスト市テスト町1-11" }
    active { true }
    is_guest { false }
    email { "test@example.com" }
    password { "passwordtest" } 
    encrypted_password { Devise.friendly_token }
    reset_password_token { nil }
    reset_password_sent_at { nil }
  end
end
