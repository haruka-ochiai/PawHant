class Tagging < ApplicationRecord
  belongs_to :pet_post
  belongs_to :tag
end
