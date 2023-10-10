class Message < ApplicationRecord
  belongs_to :customer
  belongs_to :room

  validates :message, presence: true

  has_one :notification, as: :subject, dependent: :destroy
  after_create_commit :create_notifications

  private
  def create_notifications
    room_customers = room.customers
    notificate_customer = room_customers.reject { |room_customer| room_customer.id == customer.id }.first
    Notification.create(subject: self, customer: notificate_customer, action_type: :received_message)
  end

end
