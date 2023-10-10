class Sighting < ApplicationRecord
  belongs_to :customer
  belongs_to :pet_post

  has_one :notification, as: :subject, dependent: :destroy
  after_create_commit :create_notifications

  private
  def create_notifications
    unless customer == pet_post.customer
      Notification.create(subject: self, customer: self.pet_post.customer, action_type: :sighting_to_own_post)
    end
  end
end
