class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservation_requests
  has_many :customers
  has_one :customer
  has_many :notifications, dependent: :destroy

  def today_notifications
    # 当日の通知を取得
    today = Date.today
    notifications.normal_notifications.where("created_at >= ? AND created_at <= ?", today.beginning_of_day, today.end_of_day)
  end

  def three_weeks_later_notifications
    # 3週間後の通知を取得
    three_weeks_later_date = 3.weeks.from_now.to_date
    notifications.three_weeks_later.where("created_at >= ?", three_weeks_later_date.beginning_of_day)
  end
end
