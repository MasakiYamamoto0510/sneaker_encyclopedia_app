class Admin::SneakersController < ApplicationController
  def new
    @sneaker_brands = SneakerBrand.all
    @sneaker = Sneaker.new
  end

  def create
    sneaker = Sneaker.new(sneaker_params)
    sneaker.admin_id = current_admin.id
    sneaker.save
    redirect_to admin_sneakers_path
  end

  def index
    @sneakers = Sneaker.all
  end

  def show
  end

  private

  def sneaker_params 
    params.require(:sneaker).permit(:image, :brand_id, :sneaker_name, :overview, :year, :month, :color, :size_sex, :size_country, :numerical_size)
  end

end
