class SessionsController < ApplicationController
  def new

  end

  def create
    customer = Customer.find_by(email: params[:session][:email])
    if customer && customer.authenticate(params[:session][:password])
      log_in(customer)
      params[:session][:remember_me] == '1' ? remember(customer) : forget(customer)
      redirect_back_or(root_path)
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
