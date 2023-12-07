class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :reservation_requests
  has_many :customers
  # has_one :customer を削除するかもしくは has_many :customers を削除する
  has_many :notifications, dependent: :destroy

  def today_notifications
    notifications.normal_notifications.today
  end

  def three_weeks_later_notifications
    notifications.three_weeks_later.from_three_weeks_later
  end
end

# app/models/notification.rb
class Notification < ApplicationRecord
  # その他の関連やバリデーション

  scope :today, -> { where(created_at: Time.zone.now.all_day) }
  scope :from_three_weeks_later, -> { where('created_at >= ?', 3.weeks.from_now.beginning_of_day) }
end
