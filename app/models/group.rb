class Group < ApplicationRecord
  has_one_attached :group_image

  has_many :group_members, dependent: :destroy
  belongs_to :owner, class_name: 'Customer'

  validates :name, presence: true
  validates :introduction, presence: true

  def get_group_image(width, height)
    unless group_image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.jpg')
      group_image.attach(io: File.open(file_path), filename: 'no-image.jpg', content_type: 'image/jpg')
    end
    group_image.variant(resize_to_limit: [width, height]).processed
  end

  def is_owned_by?(customer)
    owner.id == customer.id
  end

  def includesCustomer?(customer)
    group_members.exists?(customer_id: customer.id)
  end
end
