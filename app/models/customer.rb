class Customer < ApplicationRecord
  belongs_to :user
  has_many :reservation_requests

  def self.ransackable_attributes(auth_object = nil)
    ["allergy", "birthday", "created_at", "id", "memo", "name", "updated_at", "user_id"]
  end
end
