class ReservationRequestsController < ApplicationController
  def new
    @reservation_request = ReservationRequest.new
    @customers = current_user.customers
    @hotels = Hotel.all
  end

  def create
    @reservation_request = ReservationRequest.new(reservation_request_params)
    @reservation_request.customer_id = current_user.customer.id
    @reservation_request.hotel_id = params[:reservation_request][:hotel_id]
    if @reservation_request.save
      redirect_to @reservation_request
    else
      Rails.logger.error(@reservation_request.errors.full_messages)
      flash.now[:error] = "予約リクエストを作成できませんでした。エラーが発生しました。"
      render :new
    end
  end

  def index
    @reservation_requests = ReservationRequest.where(user_id: current_user.id)
  end

  def show
    @reservation_request = ReservationRequest.find(params[:id])
  end

  def edit
    @reservation_request = ReservationRequest.find(params[:id])
    @customers = current_user.customers
    @hotels = Hotel.all
  end

  def update
    @reservation_request = ReservationRequest.find(params[:id])
    if @reservation_request.update(reservation_request_params)
      redirect_to @reservation_request
    else
      render :edit
    end
  end

  private

  def reservation_request_params
    params.require(:reservation_request).permit(:day, :number_of_people, :is_smoking, :food, :course, :memo, :status, :customer_id, :hotel_id).merge(user_id: current_user.id)
  end
end