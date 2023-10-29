class ReservationRequest < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  belongs_to :customer
end
