class Admin::AdminsController < ApplicationController
  layout 'admin'
  def show
    @admin = Admin.find(params[:id])
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      flash[:success] = "投稿に成功しました。"
      redirect_to admin_admin_path(@admin.id)
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:admin_profile_image, :name, :self_introduction)
  end
end


