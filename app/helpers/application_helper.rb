module ApplicationHelper
  def current_user_type
    return 'admin' if admin_signed_in?
    return 'customer' if customer_signed_in?
    nil
  end
end
