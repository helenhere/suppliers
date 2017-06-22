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

  def logged_in_customer
    unless logged_in?
      redirect_to login_url
    end
  end

  def correct_customer
    @customer = Customer.find(params[:id])
    redirect_to(orders_path) unless @customer.current_customer?(@customer)
  end

  def log_in(customer)
    session[:customer_id] = customer.id
  end

  def logged_in?
    !@current_customer.nil?
  end

  def current_customer
    if (customer_id = session[:customer_id])
      @current_customer ||= Customer.find_by(id: customer_id)
    elsif (customer_id = cookies.signed[:customer_id])
      customer = Customer.find_by(id: customer_id)
      if customer && customer.authenticated?(cookies[:remember_token])
        log_in customer
        @current_customer = customer
      end
    end
  end

  def remember(customer)
    customer.remember
    cookies.permanent.signed[:customer_id] = customer.id
    cookies.permanent[:remember_token] = customer.remember_token
  end

  def current_customer?(customer)
    customer == current_customer
  end

  def forget(customer)
    customer.forget
    cookies.delete(:customer_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(@current_customer)
    session.delete(:customer_id)
    @current_customer = nil
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
end


