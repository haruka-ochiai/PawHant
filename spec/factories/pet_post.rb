FactoryBot.define do
  factory :pet_post do
    customer
    pet_status { 1 }
    species { 0 }
    gender { 2 }
    age { "２歳" }
    prefecture { "東京都" }
    area { "渋谷区" }
    occurred_on { Date.today }
    weight { 1 }
    characteristics { "人懐っこいです" }
    description { "これはテストです" }
  end
end