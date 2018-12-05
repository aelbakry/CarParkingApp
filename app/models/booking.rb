class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :parking

  scope :user, -> (id) { where(user_id: id) }
end
