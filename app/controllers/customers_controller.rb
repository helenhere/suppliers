class CustomersController < ApplicationController
  # before_action :set_customer, only: [:show, :edit, :update, :destroy]

  before_action :logged_in_customer, only: [:show, :edit, :update, :destroy]
  before_action :correct_customer, only: [:edit, :update]

  def index
    @customers = Customer.all
  end

  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)
    @customer.role = :customer

      if @customer.save
        log_in(@customer)
        redirect_to @customer
      else
        format.html { render :new }
      end
  end

  # PATCH/PUT /customers/1
  def update
    @customer = Customer.find(params[:id])

      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
      else
        format.html { render :edit }
      end
  end

  # DELETE /customers/1
  def destroy
    Customer.find(params[:id]).destroy
      redirect_to customers_path
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :phone, :email, :password, :city_id)
    end

    def logged_in_customer
      unless logged_in?
        store_location
        redirect_to login_url
      end
    end

    def correct_customer
      @customer = Customer.find(params[:id])
      redirect_to(orders_path) unless @customer.current_customer?(@customer)
    end
end


