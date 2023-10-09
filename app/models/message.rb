class Message < ApplicationRecord
  belongs_to :customer
  belongs_to :room

  validates :message, presence: true

  has_one :notification, as: :subject, dependent: :destroy
  after_create_commit :create_notifications

  private
  def create_notifications
    Notification.create(subject: self, customer: self.customer, action_type: :received_message)
  end
end
