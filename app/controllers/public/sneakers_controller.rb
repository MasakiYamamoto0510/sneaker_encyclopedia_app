class Public::SneakersController < ApplicationController
  def new
    @sneaker_brands = SneakerBrand.all
    @sneaker = Sneaker.new
  end

  def create
    @sneaker = Sneaker.new(sneaker_params)
    @sneaker.customer_id = current_customer.id
    @sneaker.save
    flash[:notice] = "投稿に成功しました。"
    redirect_to mypage_path
  end

  def index
    @sneakers = Sneaker.where(is_publish: true)
  end

  def show
    @sneaker = Sneaker.find(params[:id])
    @sneaker_brand_name = @sneaker.sneaker_brand.name
  end

  private

  def sneaker_params 
    params.require(:sneaker).permit(:image, :admin_id, :customer_id, :sneaker_brand_id, :is_publish, :sneaker_name, :overview, :year, :month, :color, :size_sex, :size_country, :numerical_size)
  end

  #is_matching_login_customer

end
