FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    phone_number { Faker::PhoneNumber.phone_number }
    postcode { '1234567' } # 7桁の数字
    address { Faker::Address.full_address }
    active { true }
    is_guest { false }
    email { Faker::Internet.email }
    encrypted_password { Devise.friendly_token }
    reset_password_token { nil }
    reset_password_sent_at { nil }
  end
end
