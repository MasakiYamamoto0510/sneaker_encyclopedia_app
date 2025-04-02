class ApplicationController < ActionController::Base
  before_action :configure_authentication
  before_action :is_matching_login_customer, only: [:edit, :update], unless: :admin_controller?

  private

  


  def configure_authentication
    if admin_controller?
      authenticate_admin!
    else
      authenticate_customer! unless action_is_public?
    end
  end

  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end

  def action_is_public?
    controller_name == 'homes' && (action_name == 'top' || action_name == 'about')
  end

end


