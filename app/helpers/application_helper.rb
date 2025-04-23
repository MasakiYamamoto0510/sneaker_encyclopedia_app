module ApplicationHelper
  def current_user_type
    return 'admin' if admin_signed_in?
    return 'customer' if customer_signed_in?
    nil
  end

  def sneaker_link(sneaker)
    if params[:controller].start_with?("admin/")
      admin_sneaker_path(sneaker)
    else
      sneaker_path(sneaker)
    end
  end
  
end
