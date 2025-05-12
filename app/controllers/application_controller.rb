class ApplicationController < ActionController::Base
  before_action :configure_authentication
  before_action :restrict_guest_customer

  private

  def configure_authentication
    if admin_controller?
      authenticate_admin!
    else
      authenticate_customer! unless action_is_public?
    end
  end

  def restrict_guest_customer
    return unless current_customer&.guest?        # 未ログイン or admin ならスルー
                                                  # guest = models/customer.rbに定義したメソッドを使用
    allowed = 
      (controller_name == "sneakers" && action_name   == "index") ||
      (controller_name == "homes" && action_name   == "about") ||
      (controller_name == "sessions" && action_name   == "destroy") 

    unless allowed
      redirect_to sneakers_path,
        alert: "ゲストユーザーはそのページは閲覧できません。終了の際はログアウトからお願いします。"
    end
  end

  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end

  def action_is_public?
    controller_name == 'homes' && (action_name == 'top' || action_name == 'about')
  end

end


