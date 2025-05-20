class Public::SneakerTypesController < ApplicationController
  def index
    @sneaker_brand = SneakerBrand.find(params[:sneaker_brand_id])
    @sneaker_types = @sneaker_brand.sneaker_types
  end

  def show 
    @sneaker_brand = SneakerBrand.find(params[:sneaker_brand_id])
    @sneaker_type = SneakerType.find(params[:id])
    @sneakers = @sneaker_type.sneakers

    sort_param = params[:sort]

    case sort_param
    when "latest"
      @sneakers = @sneakers.latest
    when "old"
      @sneakers = @sneakers.old
    else
      @sneakers = @sneakers.latest
    end

    @sneakers = @sneakers.page(params[:page]).per(25)
  end
end
