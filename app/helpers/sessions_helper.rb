module SessionsHelper
  def logged_in?
    !@current_customer.nil?
  end

  def log_in(customer)
    session[:customer_id] = customer.id
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

  def log_out
    forget(@current_customer)
    session.delete(:customer_id)
    @current_customer = nil
  end
end
