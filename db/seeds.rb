# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@admin',
  password: 'pawhant'
  )

haru = Customer.find_or_create_by!(email: "haru@example.com") do |customer|
  customer.name = "はる"
  customer.password = "password"
end

yuki = Customer.find_or_create_by!(email: "yuki@example.com") do |customer|
  customer.name = "ゆき"
  customer.password = "password"
end

kou = Customer.find_or_create_by!(email: "kou@example.com") do |customer|
  customer.name = "こう"
  customer.password = "password"
end

PetPost.find_or_create_by!(shop_name: "Cavello") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost1.jpg"), filename:"sample-petpost1.jpg")
  pet_post.age = "７歳"
  per_posst.pet_status = "lost"
  pet_post.species = "dog"
  pet_post.gender = "male"
  pet_post.prefecture = "東京都"
  pet_post.area = "板橋区〇〇町5-10"
  pet_post.occurred_on = "2023-09-10"
  pet_post.description = "夕方に散歩中のところ迷子になりました。"
  pet_post.customer = haru
end

PetPost.find_or_create_by!(shop_name: "和食屋せん") do |pet_post|
  post_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-petpost2.jpg"),
  post_image.caption = "日本料理は美しい！"
  pet_post.customer = yuki
end

PetPost.find_or_create_by!(shop_name: "ShoreditchBar") do |pet_post|
  post_image.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-petpost3.jpg")
  post_image.caption = 'メキシコ料理好きな方にオススメ！'
  pet_post.customer = kou
end