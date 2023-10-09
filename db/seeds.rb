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

eye_tag = Tag.find_or_create_by!(tag_name: "青い目")
cat_tag = Tag.find_or_create_by!(tag_name: "猫")
dog_tag = Tag.find_or_create_by!(tag_name: "犬")
bird_tag = Tag.find_or_create_by!(tag_name: "鳥")
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
green_tag = Tag.find_or_create_by!(tag_name: "緑")
white_tag = Tag.find_or_create_by!(tag_name: "白")

haru = Customer.find_or_create_by!(email: "haru@example.com") do |customer|
  customer.name = "はる"
  customer.password = "password"
  customer.postcode = "0000000"
  customer.address = "東京都板橋区"
  customer.phone_number = "00000000000"
end

haru_post = PetPost.find_or_create_by!(area: "板橋区〇〇町0-0") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-dog1.jpg"), filename:"sample-petpost-dog1.jpg")
  pet_post.pet_status = "lost"
  pet_post.species = "dog"
  pet_post.gender = "male"
  pet_post.age = "７歳"
  pet_post.weight ="between_1_and_5kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "板橋区〇〇町0-0"
  pet_post.occurred_on = "2023-09-23"
  pet_post.characteristics = "茶色い毛並みです。サイズが小柄です。"
  pet_post.description = "夕方に散歩中のところ迷子になりました。"
  pet_post.customer = haru
end

Tagging.find_or_create_by!(pet_post_id: haru_post.id, tag_id: dog_tag.id)
Tagging.find_or_create_by!(pet_post_id: haru_post.id, tag_id: brown_tag.id)

yuki = Customer.find_or_create_by!(email: "yuki@example.com") do |customer|
  customer.name = "ゆき"
  customer.password = "password"
  customer.postcode = "1111111"
  customer.address = "東京都世田谷区"
  customer.phone_number = "11111111111"
end

yuki_post = PetPost.find_or_create_by!(area: "世田谷区〇〇町1-1") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-cat1.jpg"), filename:"sample-petpost-cat1.jpg")
  pet_post.pet_status = "lost"
  pet_post.species = "cat"
  pet_post.gender = "female"
  pet_post.age = "5歳"
  pet_post.weight ="between_1_and_5kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "世田谷区〇〇町1-1"
  pet_post.occurred_on = "2023-09-23"
  pet_post.characteristics = "青い目です。人懐っこいです。"
  pet_post.description = "窓が開いているところを不注意で脱走してしまいました。"
  pet_post.customer = yuki
end

Tagging.find_or_create_by!(pet_post_id: yuki_post.id, tag_id: eye_tag.id)
Tagging.find_or_create_by!(pet_post_id: yuki_post.id, tag_id: cat_tag.id)

kou = Customer.find_or_create_by!(email: "kou@example.com") do |customer|
  customer.name = "こう"
  customer.password = "password"
  customer.postcode = "2222222"
  customer.address = "東京都新宿区"
  customer.phone_number = "22222222222"
end

kou_post = PetPost.find_or_create_by!(area: "新宿区〇〇町2-2") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-bird1.jpg"), filename:"sample-petpost-bird1.jpg")
  pet_post.pet_status = "lost"
  pet_post.species = "bird"
  pet_post.gender = "female"
  pet_post.age = "成鳥"
  pet_post.weight ="less_than_1kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "新宿区〇〇町4-10"
  pet_post.occurred_on = "2023-09-23"
  pet_post.characteristics = "綺麗な毛色です。警戒心が強いです。"
  pet_post.description = "鳥籠の掃除後に少しドアが開いておりそこから脱走してしまいました。"
  pet_post.customer = kou
end

Tagging.find_or_create_by!(pet_post_id: kou_post.id, tag_id: blue_tag.id)
Tagging.find_or_create_by!(pet_post_id: kou_post.id, tag_id: bird_tag.id)

yuma = Customer.find_or_create_by!(email: "yuma@example.com") do |customer|
  customer.name = "優馬"
  customer.password = "password"
  customer.postcode = "4444444"
  customer.address = "東京都足立区"
  customer.phone_number = "44444444444"
end

yuma_post = PetPost.find_or_create_by!(area: "足立区〇〇町4-4") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-dog2.jpg"), filename:"sample-petpost-dog2.jpg")
  pet_post.pet_status = "lost"
  pet_post.species = "dog"
  pet_post.gender = "male"
  pet_post.age = "3歳"
  pet_post.weight ="between_1_and_5kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "足立区〇〇町4-4"
  pet_post.occurred_on = "2023-09-23"
  pet_post.characteristics = "茶色で小柄です。人懐っこいです。"
  pet_post.description = "目を離した隙に玄関から脱走しました。"
  pet_post.customer = yuma
end

Tagging.find_or_create_by!(pet_post_id: yuma_post.id, tag_id: brown_tag.id)
Tagging.find_or_create_by!(pet_post_id: yuma_post.id, tag_id: puppy_tag.id)

minato = Customer.find_or_create_by!(email: "minato@example.com") do |customer|
  customer.name = "湊"
  customer.password = "password"
  customer.postcode = "5555555"
  customer.address = "東京都千代田区"
  customer.phone_number = "55555555555"
end

minato_post = PetPost.find_or_create_by!(area: "千代田区〇〇町5-5") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-cat2.jpg"), filename:"sample-petpost-cat2.jpg")
  pet_post.pet_status = "lost"
  pet_post.species = "cat"
  pet_post.gender = "female"
  pet_post.age = "2歳"
  pet_post.weight ="between_1_and_5kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "千代田区〇〇町5-5"
  pet_post.occurred_on = "2023-09-23"
  pet_post.characteristics = "茶色で小柄です。警戒心が強いです。"
  pet_post.description = "早く見つかって欲しいです。"
  pet_post.customer = minato
end

Tagging.find_or_create_by!(pet_post_id: minato_post.id, tag_id: brown_tag.id)
Tagging.find_or_create_by!(pet_post_id: minato_post.id, tag_id: kitten_tag.id)

arata = Customer.find_or_create_by!(email: "arata@example.com") do |customer|
  customer.name = "新"
  customer.password = "password"
  customer.postcode = "6666666"
  customer.address = "東京都港区"
  customer.phone_number = "66666666666"
end

arata_post = PetPost.find_or_create_by!(area: "港区〇〇町6-6") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-bird2.jpg"), filename:"sample-petpost-bird2.jpg")
  pet_post.pet_status = "lost"
  pet_post.species = "bird"
  pet_post.gender = "male"
  pet_post.age = "成鳥"
  pet_post.weight ="less_than_1kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "港区〇〇町6-6"
  pet_post.occurred_on = "2023-09-23"
  pet_post.characteristics = "青色です。飛ぶことが苦手です。"
  pet_post.description = "目を離したすきに外に出てしまいました。"
  pet_post.customer = arata
end

Tagging.find_or_create_by!(pet_post_id: arata_post.id, tag_id: parakeet_tag.id)
Tagging.find_or_create_by!(pet_post_id: arata_post.id, tag_id: blue_tag.id)

aoi = Customer.find_or_create_by!(email: "aoi@example.com") do |customer|
  customer.name = "あおい"
  customer.password = "password"
  customer.postcode = "7777777"
  customer.address = "東京都文京区"
  customer.phone_number = "77777777777"
end

aoi_post = PetPost.find_or_create_by!(area: "文京区〇〇町7-7") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-other2.jpg"), filename:"sample-petpost-other2.jpg")
  pet_post.pet_status = "lost"
  pet_post.species = "other"
  pet_post.gender = "female"
  pet_post.age = "3歳"
  pet_post.weight ="between_1_and_5kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "文京区〇〇町7-7"
  pet_post.occurred_on = "2023-09-23"
  pet_post.characteristics = "茶色です。警戒心が強いです。"
  pet_post.description = "公園で遊ばせた時に行方不明になりました。"
  pet_post.customer = aoi
end

Tagging.find_or_create_by!(pet_post_id: aoi_post.id, tag_id: brown_tag.id)
Tagging.find_or_create_by!(pet_post_id: aoi_post.id, tag_id: rabbit_tag.id)

itsuki = Customer.find_or_create_by!(email: "itsuki@example.com") do |customer|
  customer.name = "いつき"
  customer.password = "password"
  customer.postcode = "8888888"
  customer.address = "東京都板橋区"
  customer.phone_number = "88888888888"
end

itsuki_post = PetPost.find_or_create_by!(area: "板橋区〇〇町8-8") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-dog3.jpg"), filename:"sample-petpost-dog3.jpg")
  pet_post.pet_status = "found"
  pet_post.species = "dog"
  pet_post.gender = "female"
  pet_post.age = "成犬"
  pet_post.weight ="between_1_and_5kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "板橋区〇〇町8-8"
  pet_post.occurred_on = "2023-09-24"
  pet_post.characteristics = "人懐っこくとてもかわいいです。"
  pet_post.description = "お腹が空いていたようで近寄ってきました"
  pet_post.customer = itsuki
end

Tagging.find_or_create_by!(pet_post_id: itsuki_post.id, tag_id: white_tag.id)
Tagging.find_or_create_by!(pet_post_id: itsuki_post.id, tag_id: dog_tag.id)

yuna = Customer.find_or_create_by!(email: "yuna@example.com") do |customer|
  customer.name = "由奈"
  customer.password = "password"
  customer.postcode = "9999999"
  customer.address = "東京都世田谷区"
  customer.phone_number = "99999999999"
end

yuna_post = PetPost.find_or_create_by!(area: "世田谷区〇〇町9-9") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-cat3.jpg"), filename:"sample-petpost-cat3.jpg")
  pet_post.pet_status = "found"
  pet_post.species = "cat"
  pet_post.gender = "female"
  pet_post.age = "成猫"
  pet_post.weight ="between_1_and_5kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "世田谷区〇〇町9-9"
  pet_post.occurred_on = "2023-09-24"
  pet_post.characteristics = "やんちゃです。毛並みが綺麗です。"
  pet_post.description = "近くの公園で保護しました。"
  pet_post.customer = yuna
end

Tagging.find_or_create_by!(pet_post_id: yuna_post.id, tag_id: gray_tag.id)
Tagging.find_or_create_by!(pet_post_id: yuna_post.id, tag_id: cat_tag.id)

sakura = Customer.find_or_create_by!(email: "sakura@example.com") do |customer|
  customer.name = "咲良"
  customer.password = "password"
  customer.postcode = "1010101"
  customer.address = "東京都新宿区"
  customer.phone_number = "10101010101"
end

sakura_post = PetPost.find_or_create_by!(area: "新宿区〇〇町10-10") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-bird3.jpg"), filename:"sample-petpost-bird3.jpg")
  pet_post.pet_status = "found"
  pet_post.species = "bird"
  pet_post.gender = "female"
  pet_post.age = "成鳥"
  pet_post.weight ="less_than_1kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "新宿区〇〇町10-10"
  pet_post.occurred_on = "2023-09-24"
  pet_post.characteristics = "人懐っこいです。"
  pet_post.description = "近くに寄ってきました。"
  pet_post.customer = sakura
end

Tagging.find_or_create_by!(pet_post_id: sakura_post.id, tag_id: green_tag.id)
Tagging.find_or_create_by!(pet_post_id: sakura_post.id, tag_id: parakeet_tag.id)

rin = Customer.find_or_create_by!(email: "rin@example.com") do |customer|
  customer.name = "凛"
  customer.password = "password"
  customer.postcode = "1212121"
  customer.address = "東京都練馬区"
  customer.phone_number = "12121212121"
end

rin_post = PetPost.find_or_create_by!(area: "練馬区〇〇町12-12") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-other3.jpg"), filename:"sample-petpost-other3.jpg")
  pet_post.pet_status = "found"
  pet_post.species = "other"
  pet_post.gender = "unknown"
  pet_post.age = "子供です"
  pet_post.weight ="between_1_and_5kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "練馬区〇〇町12-12"
  pet_post.occurred_on = "2023-09-24"
  pet_post.characteristics = "まだサイズが小さいです。"
  pet_post.description = "道で倒れていたところを保護しました。"
  pet_post.customer = rin
end

Tagging.find_or_create_by!(pet_post_id: rin_post.id, tag_id: brown_tag.id)
Tagging.find_or_create_by!(pet_post_id: rin_post.id, tag_id: ferret_tag.id)

an = Customer.find_or_create_by!(email: "an@example.com") do |customer|
  customer.name = "杏"
  customer.password = "password"
  customer.postcode = "1313131"
  customer.address = "東京都足立区"
  customer.phone_number = "13131313131"
end

an_post = PetPost.find_or_create_by!(area: "足立区〇〇町13-13") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-dog4.jpg"), filename:"sample-petpost-dog4.jpg")
  pet_post.pet_status = "found"
  pet_post.species = "dog"
  pet_post.gender = "male"
  pet_post.age = "成犬"
  pet_post.weight ="between_1_and_5kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "足立区〇〇町13-13"
  pet_post.occurred_on = "2023-09-24"
  pet_post.characteristics = "茶色です。賢いです。"
  pet_post.description = "足を怪我していたので保護しました。"
  pet_post.customer = an
end

Tagging.find_or_create_by!(pet_post_id: an_post.id, tag_id: brown_tag.id)
Tagging.find_or_create_by!(pet_post_id: an_post.id, tag_id: dog_tag.id)

riko = Customer.find_or_create_by!(email: "riko@example.com") do |customer|
  customer.name = "りこ"
  customer.password = "password"
  customer.postcode = "1414141"
  customer.address = "東京都千代田区"
  customer.phone_number = "14141414141"
end

riko_post = PetPost.find_or_create_by!(area: "千代田区〇〇町14-14") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-cat4.jpg"), filename:"sample-petpost-cat4.jpg")
  pet_post.pet_status = "found"
  pet_post.species = "cat"
  pet_post.gender = "male"
  pet_post.age = "成猫"
  pet_post.weight ="between_1_and_5kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "千代田区〇〇町14-14"
  pet_post.occurred_on = "2023-09-24"
  pet_post.characteristics = "茶色です。鳴き声が高いです。"
  pet_post.description = "お腹が空いていたようだったので保護しました。"
  pet_post.customer = riko
end

Tagging.find_or_create_by!(pet_post_id: riko_post.id, tag_id: brown_tag.id)
Tagging.find_or_create_by!(pet_post_id: riko_post.id, tag_id: cat_tag.id)

yusuke = Customer.find_or_create_by!(email: "yusuke@example.com") do |customer|
  customer.name = "ゆうすけ"
  customer.password = "password"
  customer.postcode = "1515151"
  customer.address = "東京都港区"
  customer.phone_number = "15151515151"
end

yusuke_post = PetPost.find_or_create_by!(area: "港区〇〇町15-15") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-bird4.jpg"), filename:"sample-petpost-bird4.jpg")
  pet_post.pet_status = "found"
  pet_post.species = "bird"
  pet_post.gender = "unknown"
  pet_post.age = "成鳥"
  pet_post.weight ="less_than_1kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "港区〇〇町15-15"
  pet_post.occurred_on = "2023-09-24"
  pet_post.characteristics = "黄色です。おしゃべりです。"
  pet_post.description = "弱っていたので保護しました。"
  pet_post.customer = yusuke
end

Tagging.find_or_create_by!(pet_post_id: yusuke_post.id, tag_id: yellow_tag.id)
Tagging.find_or_create_by!(pet_post_id: yusuke_post.id, tag_id: bird_tag.id)

riku = Customer.find_or_create_by!(email: "riku@example.com") do |customer|
  customer.name = "りく"
  customer.password = "password"
  customer.postcode = "1717171"
  customer.address = "東京都中央区"
  customer.phone_number = "17171717171"
end

riku_post = PetPost.find_or_create_by!(area: "中央区〇〇町17-17") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-dog5.jpg"), filename:"sample-petpost-dog5.jpg")
  pet_post.pet_status = "found"
  pet_post.species = "dog"
  pet_post.gender = "male"
  pet_post.age = "成犬"
  pet_post.weight ="between_5_and_10kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "中央区〇〇町17-17"
  pet_post.occurred_on = "2023-09-25"
  pet_post.characteristics = "愛嬌があってかわいいです。"
  pet_post.description = "保護しました"
  pet_post.customer = riku
end

Tagging.find_or_create_by!(pet_post_id: riku_post.id, tag_id: brown_tag.id)
Tagging.find_or_create_by!(pet_post_id: riku_post.id, tag_id: dog_tag.id)

kazu = Customer.find_or_create_by!(email: "kazu@example.com") do |customer|
  customer.name = "かず"
  customer.password = "password"
  customer.postcode = "1818181"
  customer.address = "東京都足立区"
  customer.phone_number = "18181818181"
end

kazu_post = PetPost.find_or_create_by!(area: "足立区〇〇町18-18") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-dog6.jpg"), filename:"sample-petpost-dog6.jpg")
  pet_post.pet_status = "lost"
  pet_post.species = "dog"
  pet_post.gender = "male"
  pet_post.age = "成犬"
  pet_post.weight ="between_5_and_10kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "足立区〇〇町18-18"
  pet_post.occurred_on = "2023-09-25"
  pet_post.characteristics = "小柄で動きが速いです"
  pet_post.description = "迷子になって心配しています。よろしくお願いします。"
  pet_post.customer = kazu
end

Tagging.find_or_create_by!(pet_post_id: kazu_post.id, tag_id: white_tag.id)
Tagging.find_or_create_by!(pet_post_id: kazu_post.id, tag_id: bulldog_tag.id)

toshi = Customer.find_or_create_by!(email: "toshi@example.com") do |customer|
  customer.name = "とし"
  customer.password = "password"
  customer.postcode = "1919191"
  customer.address = "東京都葛飾区"
  customer.phone_number = "19191919191"
end

taro = Customer.find_or_create_by!(email: "taro@example.com") do |customer|
  customer.name = "たろう"
  customer.password = "password"
  customer.postcode = "2020202"
  customer.address = "東京都葛飾区"
  customer.phone_number = "20202020202"
end

taro_post = PetPost.find_or_create_by!(area: "葛飾区〇〇町20-20") do |pet_post|
  pet_post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-cat6.jpg"), filename:"sample-petpost-cat6.jpg")
  pet_post.pet_status = "lost"
  pet_post.species = "cat"
  pet_post.gender = "male"
  pet_post.age = "７歳"
  pet_post.weight ="between_1_and_5kg"
  pet_post.prefecture = "東京都"
  pet_post.area = "葛飾区〇〇町20-20"
  pet_post.occurred_on = "2023-09-26"
  pet_post.characteristics = "臆病で人見知りです。"
  pet_post.description = "中々帰って来ず心配しています"
  pet_post.customer = taro
end

Tagging.find_or_create_by!(pet_post_id: taro_post.id, tag_id: brack_tag.id)
Tagging.find_or_create_by!(pet_post_id: taro_post.id, tag_id: cat_tag.id)

CustomerPet.find_or_create_by!(characteristics: "臆病で人見知りです。") do |customer_pet|
  customer_pet.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-cat6.jpg"), filename:"sample-petpost-cat6.jpg")
  customer_pet.customer_id = "taro.id"
  customer_pet.pet_status = "normal"
  customer_pet.species = "cat"
  customer_pet.name = "くろ"
  customer_pet.gender = "male"
  customer_pet.age = "７歳"
  customer_pet.weight ="between_1_and_5kg"
  customer_pet.characteristics = "臆病で人見知りです。"
  customer_pet.customer = taro
end

CustomerPet.find_or_create_by!(characteristics: "警戒心が強く人見知りです。") do |customer_pet|
  customer_pet.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer-pet-cat1.jpg"), filename:"sample-customer-pet-cat1.jpg")
  customer_pet.customer_id = "itsuki.id"
  customer_pet.pet_status = "normal"
  customer_pet.species = "cat"
  customer_pet.name = "ナナ"
  customer_pet.gender = "male"
  customer_pet.age = "８歳"
  customer_pet.weight ="between_1_and_5kg"
  customer_pet.characteristics = "警戒心が強く人見知りです。"
  customer_pet.customer = itsuki
end


CustomerPet.find_or_create_by!(characteristics: "いろいろなことに好奇心旺盛です。") do |customer_pet|
  customer_pet.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-customer-pet-dog2.jpg"), filename:"sample-customer-pet-dog2.jpg")
  customer_pet.customer_id = "an.id"
  customer_pet.pet_status = "normal"
  customer_pet.species = "dog"
  customer_pet.name = "コタ"
  customer_pet.gender = "female"
  customer_pet.age = "1歳"
  customer_pet.weight ="between_1_and_5kg"
  customer_pet.characteristics = "いろいろなことに好奇心旺盛です。"
  customer_pet.customer = an
end

shinjuku_group = Group.find_or_create_by!(name: "新宿区") do |group|
  group.group_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-bird3.jpg"), filename:"sample-petpost3.jpg")
  group.introduction = "鳥を探しています。情報共有お願いします。"
  group.owner_id = kou.id
end

GroupMember.find_or_create_by!(group_id: shinjuku_group.id, customer_id: sakura.id)
GroupMember.find_or_create_by!(group_id: shinjuku_group.id, customer_id: kou.id)

adachi_group = Group.find_or_create_by!(name: "足立区") do |group|
  group.group_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-dog2.jpg"), filename:"sample-petpost-dog2.jpg")
  group.introduction = "犬を探しています。"
  group.owner_id = yuma.id
end

GroupMember.find_or_create_by!(group_id: adachi_group.id, customer_id: an.id)
GroupMember.find_or_create_by!(group_id: adachi_group.id, customer_id: kazu.id)
GroupMember.find_or_create_by!(group_id: adachi_group.id, customer_id: yuma.id)

itabashi_group = Group.find_or_create_by!(name: "板橋区") do |group|
  group.group_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-no-image.jpg"), filename:"sample-no-image.jpg")
  group.introduction = "犬が好きです。情報共有しましょう。"
  group.owner_id = haru.id
end

GroupMember.find_or_create_by!(group_id: itabashi_group.id, customer_id: haru.id)
GroupMember.find_or_create_by!(group_id: itabashi_group.id, customer_id: itsuki.id)

katsushika_group = Group.find_or_create_by!(name: "葛飾区") do |group|
  group.group_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-petpost-cat6.jpg"), filename:"sample-petpost-cat6.jpg")
  group.introduction = "猫が好きです。猫探し手伝いお願いします。"
  group.owner_id = taro.id
end

GroupMember.find_or_create_by!(group_id: katsushika_group.id, customer_id: taro.id)
GroupMember.find_or_create_by!(group_id: katsushika_group.id, customer_id: rin.id)
GroupMember.find_or_create_by!(group_id: katsushika_group.id, customer_id: toshi.id)

Sighting.find_or_create_by!(pet_post_id: taro_post.id, customer_id: toshi.id)