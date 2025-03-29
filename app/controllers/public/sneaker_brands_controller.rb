class Public::SneakerBrandsController < ApplicationController

  def index
    @sneaker_brands = SneakerBrand.all
  end 

  def show
    @sneaker_brand = SneakerBrand.find(params[:id])
    @sneaker_types = @sneaker_brand.sneaker_types
  end
  
end