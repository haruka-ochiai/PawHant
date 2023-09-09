class PetPost < ApplicationRecord
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :sightings, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags,　through: :taggings

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

  has_one_attached :image

  # ペットの状況
  enum pet_status: { normal: 0, lost: 1, found: 2, resolved: 3 }
  # ペットの種類
  enum species: { dog: 0, cat: 1, bird: 2, other: 3 }
  enum gender: { male: 0, female: 1, unknown: 2 }
  enum weight: {less_than_1kg: 0, between_1_and_5kg: 1, between_5_and_10kg: 2, over_10kg: 3 }
end
