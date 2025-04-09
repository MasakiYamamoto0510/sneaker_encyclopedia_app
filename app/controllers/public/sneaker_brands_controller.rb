class Public::SneakerBrandsController < ApplicationController

  def index
    @sneaker_brands = SneakerBrand.all
  end 

  def show
    @sneaker_brand = SneakerBrand.find(params[:id])
    @sneaker_types = @sneaker_brand.sneaker_types

    @sneakers = Sneaker.joins(sneaker_type: :sneaker_brand)
                       .where(sneaker_types: { sneaker_brand_id: @sneaker_brand.id })

    sort_param = params[:sort]

    case sort_param
    when "latest"
      @sneakers = @sneakers.latest
    when "old"
      @sneakers = @sneakers.old
    else
      @sneakers = @sneakers.latest
    end
  end
  
end