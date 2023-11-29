class Customer < ApplicationRecord
  belongs_to :user
  has_many :reservation_requests, dependent: :destroy

  def self.ransackable_attributes(_auth_object = nil)
    %w[allergy birthday created_at id memo name updated_at user_id]
  end
end
