class PetPost < ApplicationRecord
  has_one_attached :image

  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :sightings, dependent: :destroy
  has_many :customers, through: :sightings
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  # 通知
  has_one :notification, as: :subject, dependent: :destroy


  #バリデーション
  validates :age, presence: true
  validates :pet_status, presence: true
  validates :species, presence: true
  validates :gender, presence: true
  validates :prefecture, presence: true
  validates :area, presence: true, length: { minimum: 2, maximum: 20 }
  validates :occurred_on, presence: true
  validates :weight, presence: true
  validates :characteristics, presence: true, length: { minimum: 2, maximum: 50 }
  validates :description, presence: true, length: { minimum: 2, maximum: 60 }
  # validates :image, presence: true

  def favorited_by?(customer)
    sightings.exists?(customer_id: customer.id)
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/animal-no-image.jpg')
      image.attach(io: File.open(file_path), filename: 'animal-no-image.jpg', content_type: 'image/jpg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

   # タグの処理
  def save_tag(sent_tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old_tag_name|
      tag_to_delete = self.tags.find_by(tag_name: old_tag_name)
      self.tags.delete(tag_to_delete) if tag_to_delete
    end

    # 新しいタグを保存
    new_tags.each do |new_tag_name|
      new_pet_post_tag = Tag.find_or_create_by(tag_name: new_tag_name)
      self.tags << new_pet_post_tag
   end
  end

  # 絞り込み検索
  def self.ransackable_attributes(auth_object = nil)
    ["age", "area", "gender", "occurred_on", "pet_status", "prefecture", "species"]
  end

  # ペットの状況
  enum pet_status: { normal: 0, lost: 1, found: 2, resolved: 3 }
  # ペットの種類
  enum species: { dog: 0, cat: 1, bird: 2, other: 3 }
  enum gender: { male: 0, female: 1, unknown: 2 }
  enum weight: {less_than_1kg: 0, between_1_and_5kg: 1, between_5_and_10kg: 2, over_10kg: 3 }


end
