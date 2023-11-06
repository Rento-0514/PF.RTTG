class NotificationJob < ApplicationJob
    queue_as :default
  
    def perform
        # 当日の通知を作成
        ReservationRequest.where(day: Date.today).each do |reservation|
          Notification.create(user: reservation.user, reservation_request: reservation, notification_type: 'normal')
        end
      
        # 3週間後の通知を作成
        three_weeks_later_date = 3.weeks.from_now.to_date
        ReservationRequest.where(day: three_weeks_later_date, status: false).each do |reservation|
          Notification.create(user: reservation.user, reservation_request: reservation, notification_type: 'three_weeks_later')
        end
      end
  end