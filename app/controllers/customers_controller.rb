class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
      
    if @customer.save
      redirect_to @customer
    else
      render :new
    end
  end

  def index
    @customers = Customer.where(user_id: current_user.id)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :birthday, :allergy, :memo).merge(user_id: current_user.id)
  end
end
