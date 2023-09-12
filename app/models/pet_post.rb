class PetPost < ApplicationRecord
  has_one_attached :image

  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :sightings, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  # 通知
  has_one :notification, as: :subject, dependent: :destroy

  #バリデーション
  validates :age, presence: true
  validates :prefecture, presence: true
  validates :area, presence: true
  validates :occurred_on, presence: true
  validates :weight, presence: true
  validates :characteristics, presence: true
  validates :description, presence: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/animal-no-image.jpg')
      image.attach(io: File.open(file_path), filename: 'animal-no-image.jpg', content_type: 'image/jpg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def save_tag(sent_tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete　Tag.find_by(tag_name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_tag
   end
  end


  # ペットの状況
  enum pet_status: { normal: 0, lost: 1, found: 2, resolved: 3 }
  # ペットの種類
  enum species: { dog: 0, cat: 1, bird: 2, other: 3 }
  enum gender: { male: 0, female: 1, unknown: 2 }
  enum weight: {less_than_1kg: 0, between_1_and_5kg: 1, between_5_and_10kg: 2, over_10kg: 3 }
end
