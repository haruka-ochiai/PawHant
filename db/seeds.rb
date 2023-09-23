# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.find_or_create_by!(email: 'admin@admin') do |admin|
  admin.password = 'pawhant'
end

haru = Customer.find_or_create_by!(email: "haru@example.com") do |customer|
  customer.name = "はる"
  customer.password = "password"
  customer.postcode = "0000000"
  customer.address = "東京都板橋区"
  customer.phone_number = "00000000000"
end

yuki = Customer.find_or_create_by!(email: "yuki@example.com") do |customer|
  customer.name = "ゆき"
  customer.password = "password"
  customer.postcode = "1111111"
  customer.address = "東京都世田谷区"
  customer.phone_number = "11111111111"
end

kou = Customer.find_or_create_by!(email: "kou@example.com") do |customer|
  customer.name = "こう"
  customer.password = "password"
  customer.postcode = "2222222"
  customer.address = "東京都新宿区"
  customer.phone_number = "22222222222"
end

sakura = Customer.find_or_create_by!(email: "sakura@example.com") do |customer|
  customer.name = "咲良"
  customer.password = "password"
  customer.postcode = "3333333"
  customer.address = "東京都新宿区"
  customer.phone_number = "33333333333"
end

haru_post = PetPost.find_or_create_by!(area: "板橋区〇〇町5-10") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost1.jpg"), filename:"sample-petpost1.jpg")
  pet_post.pet_status = "lost"
  pet_post.species = "dog"
  pet_post.gender = "male"
  pet_post.age = "７歳"
  pet_post.weight ="between_1_and_5kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "板橋区〇〇町5-10"
  pet_post.occurred_on = "2023-09-10"
  pet_post.characteristics = "茶色い毛並みです。サイズが小柄です。"
  pet_post.description = "夕方に散歩中のところ迷子になりました。"
  pet_post.customer = haru
end

yuki_post = PetPost.find_or_create_by!(area: "世田谷区〇〇町6-10") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost2.jpg"), filename:"sample-petpost2.jpg")
  pet_post.pet_status = "lost"
  pet_post.species = "cat"
  pet_post.gender = "female"
  pet_post.age = "5歳"
  pet_post.weight ="between_1_and_5kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "世田谷区〇〇町6-10"
  pet_post.occurred_on = "2023-09-15"
  pet_post.characteristics = "青い目です。人懐っこいです。"
  pet_post.description = "窓が開いているところを不注意で脱走してしまいました。"
  pet_post.customer = yuki
end

kou_post = PetPost.find_or_create_by!(area: "新宿区〇〇町4-10") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost3.jpg"), filename:"sample-petpost3.jpg")
  pet_post.pet_status = "lost"
  pet_post.species = "bird"
  pet_post.gender = "female"
  pet_post.age = "成鳥"
  pet_post.weight ="less_than_1kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "新宿区〇〇町4-10"
  pet_post.occurred_on = "2023-09-12"
  pet_post.characteristics = "綺麗な毛色です。警戒心が強いです。"
  pet_post.description = "鳥籠の掃除後に少しドアが開いておりそこから脱走してしまいました。"
  pet_post.customer = kou
end

sakura_post = PetPost.find_or_create_by!(area: "新宿区〇〇町8-10") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost3.jpg"), filename:"sample-petpost3.jpg")
  pet_post.pet_status = "found"
  pet_post.species = "bird"
  pet_post.gender = "female"
  pet_post.age = "成鳥"
  pet_post.weight ="less_than_1kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "新宿区〇〇町8-10"
  pet_post.occurred_on = "2023-09-10"
  pet_post.characteristics = "人懐っこいです。"
  pet_post.description = "近くの公園で保護しました"
  pet_post.customer = sakura
end

eye_tag = Tag.find_or_create_by!(tag_name: "青い目")
cat_tag = Tag.find_or_create_by!(tag_name: "猫")
dog_tag = Tag.find_or_create_by!(tag_name: "犬")
bird_tag = Tag.find_or_create_by!(tag_name: "鳥")
turtle_tag = Tag.find_or_create_by!(tag_name: "カメ")
brown_tag = Tag.find_or_create_by!(tag_name: "茶色")
brack_tag = Tag.find_or_create_by!(tag_name: "黒")
blue_tag = Tag.find_or_create_by!(tag_name: "青")
rabbit_tag = Tag.find_or_create_by!(tag_name: "ウサギ")
ferret_tag = Tag.find_or_create_by!(tag_name: "フェレット")
puppy_tag = Tag.find_or_create_by!(tag_name: "子犬")
kitten_tag = Tag.find_or_create_by!(tag_name: "子猫")
parakeet_tag = Tag.find_or_create_by!(tag_name: "インコ")
gray_tag = Tag.find_or_create_by!(tag_name: "灰色")
yellow_tag = Tag.find_or_create_by!(tag_name: "黄色")
bulldog_tag = Tag.find_or_create_by!(tag_name: "ブルドッグ")
siameseg_tag = Tag.find_or_create_by!(tag_name: "シャム")


Tagging.find_or_create_by!(pet_post_id: yuki_post.id, tag_id: eye_tag.id)
Tagging.find_or_create_by!(pet_post_id: yuki_post.id, tag_id: cat_tag.id)

shinjuku_group = Group.find_or_create_by!(name: "新宿区") do |group|
  group.group_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost3.jpg"), filename:"sample-petpost3.jpg")
  group.introduction = "鳥を探しています。"
  group.owner_id = kou.id
end

GroupMember.find_or_create_by!(group_id: shinjuku_group.id, customer_id: haru.id)