class Hotel < ApplicationRecord
  has_many :reservation_requests
end
