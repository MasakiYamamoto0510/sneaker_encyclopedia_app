class Public::SneakerTypesController < ApplicationController
  def index
    @sneaker_brand = SneakerBrand.find(params[:sneaker_brand_id])
    @sneaker_types = @sneaker_brand.sneaker_types
  end

  def show 
    @sneaker_type = SneakerType.find(params[:id])
    @sneakers = @sneaker_type.sneakers
  end
end
