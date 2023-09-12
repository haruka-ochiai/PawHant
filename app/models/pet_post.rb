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

  def create_tags(input_tags)
    input_tags.each do |tag|                     # splitで分けたtagをeach文で取得する
      new_tag = Tag.find_or_create_by(tag_name: tag) # tagモデルに存在していれば、そのtagを使用し、なければ新規登録する
      tags << new_tag                            # 登録するtopicのtagに紐づける（中間テーブルにも反映される）
    end
  end


  # ペットの状況
  enum pet_status: { normal: 0, lost: 1, found: 2, resolved: 3 }
  # ペットの種類
  enum species: { dog: 0, cat: 1, bird: 2, other: 3 }
  enum gender: { male: 0, female: 1, unknown: 2 }
  enum weight: {less_than_1kg: 0, between_1_and_5kg: 1, between_5_and_10kg: 2, over_10kg: 3 }
end
