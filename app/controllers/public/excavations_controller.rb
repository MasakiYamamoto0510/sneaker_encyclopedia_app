class Public::ExcavationsController < ApplicationController

  def new
    @excavation = Excavation.new
  end

  def create 
    @excavation = Excavation.new(excavation_params)
    @excavation.customer_id = current_customer.id
    @excavation.save
    flash[:notice] = "投稿に成功しました。"
    redirect_to mypage_path
  end
  
  
  private

  def excavation_params
    params.require(:excavation).permit(:sneaker_name, :brand_name, :overview, :year_of_manufacture, :color, :size, :remarks)
  end

  #is_matching_login_customer


end
