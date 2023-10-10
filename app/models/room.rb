class Room < ApplicationRecord
  belongs_to :customer
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :customers, through: :entries
end
