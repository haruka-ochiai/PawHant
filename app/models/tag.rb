class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :pet_posts, through: :taggings

  validates :tag, presence: true
end
