class CustomersController < ApplicationController
  # before_action :set_customer, only: [:show, :edit, :update, :destroy]

  before_action :logged_in_customer, only: [:show, :edit, :update, :destroy]
  before_action :correct_customer, only: [:edit, :update]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
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
  # POST /customers.json
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
  # PATCH/PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])

      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
      else
        format.html { render :edit }
      end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    Customer.find(params[:id]).destroy
      redirect_to customers_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :phone, :email, :password, :city_id)
    end

    def logged_in_customer
      unless logged_in?
        redirect_to login_url
      end
    end

    def correct_customer
      @customer = Customer.find(params[:id])
      redirect_to(orders_path) unless @customer.current_customer?(@customer)
    end
end


