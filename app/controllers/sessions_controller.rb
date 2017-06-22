class SessionsController < ApplicationController
  def new

  end

  def create
    customer = Customer.find_by(email: params[:session][:email])
    if customer && customer.authenticate(params[:session][:password])
      log_in(customer)
      params[:session][:remember_me] == '1' ? remember(customer) : forget(customer)
      redirect_to(session[:forwarding_url] || root_path)
      session.delete(:forwarding_url)
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  def log_in(customer)
    session[:customer_id] = customer.id
  end

  def logged_in?
    !@current_customer.nil?
  end

  def log_out
    forget(@current_customer)
    session.delete(:customer_id)
    @current_customer = nil
  end

  def remember(customer)
    customer.remember
    cookies.permanent.signed[:customer_id] = customer.id
    cookies.permanent[:remember_token] = customer.remember_token
  end

  def forget(customer)
    customer.forget
    cookies.delete(:customer_id)
    cookies.delete(:remember_token)
  end
end
