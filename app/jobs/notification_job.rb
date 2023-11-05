class NotificationJob < ApplicationJob
    queue_as :default
  
    def perform
      ReservationRequest.where(day: Date.today).each do |reservation|
        Notification.create(user: reservation.user, reservation_request: reservation)
      end
    end
  end