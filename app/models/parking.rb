class Parking < ApplicationRecord
  self.primary_key = "parkingRef"

  has_many :bookings

end
