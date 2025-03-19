class Admin::SneakerBrandController < ApplicationController
  def new
    @sneaker_brand = SneakerBrand.new
  end

  def create
    sneaker_brand = SneakerBrand.new(sneaker_brand_params)
    sneaker_brand.save
    redirect_to admin_sneaker_brands_path
  end

  def index
    @sneaker_brands = SneakerBrand.all
  end

  def edit
    @sneaker_brand = SneakerBrand.find(params[:id])
  end

  def update
    @sneaker_brand = SneakerBrand.find(params[:id])
    @sneaker_brand.update(sneaker_brand_params)
    redirect_to admin_sneaker_brand_path(sneaker_brand_id)
  end

  def destroy
    sneaker_brand = SneakerBrand.find(params[:id])
    sneaker_brand.destroy
    redirect_to admin_sneaker_brands_path
  end

  private

  def sneaker_brand_params
    params.require(:sneaker_brand).permit(:name)
  end
  
end
