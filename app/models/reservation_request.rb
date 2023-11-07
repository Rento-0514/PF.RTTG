class ReservationRequest < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  belongs_to :customer
  has_many :notifications

  def self.ransackable_attributes(_auth_object = nil)
    %w[course created_at customer_id day food hotel_id id is_smoking memo number_of_people
       reservation_number status updated_at user_id]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[customer hotel user]
  end
end
