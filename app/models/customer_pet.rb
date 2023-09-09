class CustomerPet < ApplicationRecord
  belongs_to :customer


  # ペットの状況
  enum pet_status: { normal: 0, lost: 1, found: 2, resolved: 3 }
  # ペットの種類
  enum species: { dog: 0, cat: 1, bird: 2, other: 3 }
  enum gender: { male: 0, female: 1, unknown: 2 }
  enum weight: {less_than_1kg: 0, between_1_and_5kg: 1, between_5_and_10kg: 2, over_10kg: 3 }

end
