class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :pet_post
  has_one :notification, as: :subject, dependent: :destroy

  validates :comment, presence: true

  after_create_commit :create_notifications

  private
  def create_notifications
    Notification.create(subject: self, customer: pet_post.customer, action_type: :commented_to_own_post)
  end
end
