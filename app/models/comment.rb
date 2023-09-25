class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :pet_post
  has_one :notification, as: :subject, dependent: :destroy
  after_create_commit :create_notifications

  validates :comment, presence: true, length: { minimum: 1, maximum: 30 }

  private
  def create_notifications
    Notification.create(subject: self, customer: pet_post.customer, action_type: :commented_to_own_post)
  end
end
