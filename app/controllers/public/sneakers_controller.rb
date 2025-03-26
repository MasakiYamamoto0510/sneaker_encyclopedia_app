class Public::SneakersController < ApplicationController
  def new
    @sneaker_types = SneakerType.all
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
    @sneaker_brands  = SneakerBrand.all
    @sneakers = Sneaker.where(is_publish: true)
  end

  def show
    @sneaker = Sneaker.find(params[:id])
  end

  private

  def sneaker_params 
    params.require(:sneaker).permit(:image, :admin_id, :customer_id, :sneaker_type_id, :is_publish, :sneaker_name_en, :sneaker_name_ja, :year, :month )
  end

  #is_matching_login_customer

end
