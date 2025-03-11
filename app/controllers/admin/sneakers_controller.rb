class Admin::SneakersController < ApplicationController
  def new
    @sneaker_brands = SneakerBrand.all
    @sneaker = Sneaker.new
  end

  def create
    sneaker = Sneaker.new(sneaker_params)
    sneaker.admin_id = current_admin.id
    @sneaker_brand_name = sneaker.sneaker_brand.name
    sneaker.save
    redirect_to admin_sneakers_path
  end

  def index
    @sneakers = Sneaker.all
  end

  def show
    @sneaker = Sneaker.find(params[:id])
    @sneaker_brand_name = @sneaker.sneaker_brand.name
  end

  private

  def sneaker_params 
    params.require(:sneaker).permit(:image, :sneaker_brand_id, :sneaker_name, :overview, :year, :month, :color, :size_sex, :size_country, :numerical_size)
  end
  
end
