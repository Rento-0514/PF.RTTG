class ReservationRequest < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  belongs_to :customer
  has_many :notifications

  def self.ransackable_attributes(auth_object = nil)
    ["course", "created_at", "customer_id", "day", "food", "hotel_id", "id", "is_smoking", "memo", "number_of_people", "reservation_number", "status", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["customer", "hotel", "user"]
  end
end
