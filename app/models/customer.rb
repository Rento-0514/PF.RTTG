class Customer < ApplicationRecord
  belongs_to :user
  has_many :reservation_requests, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    # 'company' を含むようにする
    super + %w(company)
  end
end
