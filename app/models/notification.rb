class Notification < ApplicationRecord
  belongs_to :subject, polymorphic: true
  belongs_to :customer

  enum action_type: { commented_to_own_post: 0, sighting_to_own_post: 1 }
end
