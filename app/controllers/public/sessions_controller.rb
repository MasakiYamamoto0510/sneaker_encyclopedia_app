# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  #before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_sign_in_params, only: [:create]
  def guest_sign_in
    customer = Customer.guest            # ① 存在しなければ作成
    sign_in customer                     # ② Devise がログイン状態に
    redirect_to sneakers_path, notice: "ゲストとしてログインしました"
  end

  protected

  def after_sign_in_path_for(resource)
    sneakers_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end 

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
