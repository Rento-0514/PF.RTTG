class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to customers_path
    else
      render :new
    end
  end

  def index
    @q = current_user.customers.ransack(params[:q])
    @customers = @q.result(distinct: true)
  end

  def search
    @q = Customer.ransack(name_cont: params[:q])
    @customers = @q.result(distinct: true).limit(5)
    render json: @customers.as_json(only: %i[id name])
  end

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path, notice: 'お客様情報を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_path, notice: 'お客様情報を削除しました', status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :membership, :company, :birthday, :allergy,
                                     :memo).merge(user_id: current_user.id)
  end
end