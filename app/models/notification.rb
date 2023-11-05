class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :reservation_request

  after_create :broadcast_to_user

  private

  def broadcast_to_user
    ActionCable.server.broadcast "user_#{user_id}_notifications", self
  end
end
