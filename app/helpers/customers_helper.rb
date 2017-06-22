module CustomersHelper
  def logged_in?
    !@current_customer.nil?
  end
end
