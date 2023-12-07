class ReservationRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation_request, only: [:show, :edit, :update, :destroy]
  before_action :set_customers_and_hotels, only: [:new, :edit]

  def new
    @reservation_request = ReservationRequest.new
    @customers = current_user.customers
    @hotels = Hotel.all
  end

  def create
    @reservation_request = current_user.reservation_requests.new(reservation_request_params)
    if @reservation_request.save
      redirect_to reservation_requests_path, notice: '予約リクエストを作成しました。'
    else
      Rails.logger.error(@reservation_request.errors.full_messages)
      flash.now[:error] = '予約リクエストを作成できませんでした。エラーが発生しました。'
      @customers = current_user.customers # エラー時に必要な変数をここに移動
      render :new
    end
  end

  def index
    @q = current_user.reservation_requests.ransack(params[:q])
    @reservation_requests = @q.result(distinct: true).order(:day)

    respond_to do |format|
      format.html
      format.json do
        render json: @reservation_requests.map { |reservation_request|
          {
            id: reservation_request.id,
            title: "#{reservation_request.customer.name}",
            start: reservation_request.day,
            color: reservation_request.status ? 'blue' : 'red', # statusがtrueなら緑、falseなら赤
            url: reservation_request_path(reservation_request) # 詳細ページへのURLを追加
          }
        }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @reservation_request.update(reservation_request_params)
      redirect_to @reservation_request
    else
      set_customers_and_hotels
      render :edit
    end
  end


  def destroy
    @reservation_request.destroy
    respond_to do |format|
      format.html { redirect_to reservation_requests_path, notice: '予約を削除しました', status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_reservation_request
    @reservation_request = ReservationRequest.find(params[:id])
  end

  def set_customers_and_hotels
    @customers = current_user.customers
    @hotels = Hotel.all
  end

  def reservation_request_params
    params.require(:reservation_request).permit(:day, :number_of_people, :is_smoking, :food, :course, :memo, :status,
                                                :customer_id, :hotel_id, :reservation_number)
  end
end

