module CustomersHelper
  # def logged_in?
  #   !@current_customer.nil?
  # end
  #
  # def current_customer
  #   if (customer_id = session[:customer_id])
  #     @current_customer ||= Customer.find_by(id: customer_id)
  #   elsif (customer_id = cookies.signed[:customer_id])
  #     customer = Customer.find_by(id: customer_id)
  #     if customer && customer.authenticated?(cookies[:remember_token])
  #       log_in customer
  #       @current_customer = customer
  #     end
  #   end
  # end
  #
  # def log_in(customer)
  #   session[:customer_id] = customer.id
  # end
end
