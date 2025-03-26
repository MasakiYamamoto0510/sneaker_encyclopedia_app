def index
  @sneaker_brands = SneakerBrand.all
end 

def show
  @sneaker_brand = SneakerBrand.find(params[:sneaker_brand_id])
  @sneaker_types = @sneaker_brand.sneaker_types
end