class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :reservation_request

  after_create :broadcast_to_user

  enum notification_type: {
    normal: 'normal',
    three_weeks_ago: 'three_weeks_ago',
    three_weeks_later: 'three_weeks_later'
  }

  scope :normal_notifications, -> { where(notification_type: 'normal') }

  private

  def broadcast_to_user
    ActionCable.server.broadcast "user_#{user_id}_notifications", self
  end
end
