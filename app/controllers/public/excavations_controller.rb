class Public::ExcavationsController < ApplicationController

  def new
    @sneaker_brands = SneakerBrand.all
    @excavation = Excavation.new
  end

  def create 
    @excavation = Excavation.new(sneaker_params)
    @excavation.customer_id = current_customer.id
    @excavation.save
    flash[:notice] = "投稿に成功しました。"
    redirect_to mypage_path
  end
  
  private

  def sneaker_params 
    params.require(:excavation).permit(:image, :admin_id, :customer_id, :sneaker_brand_id, :sneaker_name, :overview, :year, :month, :color, :size_sex, :size_country, :numerical_size)
  end
  

  #is_matching_login_customer


end
