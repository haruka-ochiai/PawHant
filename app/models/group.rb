class Group < ApplicationRecord
  has_many :group_members, dependent: :destroy
  belongs_to :owner, class_name: 'Customer'

  validates :name, presence: true
  validates :introduction, presence: true

  has_one_attached :group_image

  def is_owned_by?(customer)
    owner.id == customer.id
  end
end
