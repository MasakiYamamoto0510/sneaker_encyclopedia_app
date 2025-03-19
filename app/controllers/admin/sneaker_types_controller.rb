class Admin::SneakerTypesController < ApplicationController
  layout 'admin'
  def new
    @sneaker_type = SneakerType.new
  end

  def create
    sneaker_type = SneakerType.new(sneaker_type_params)
    sneaker_type.update
    redirect_to admin_sneaker_types_path
  end

  def index
    @sneaker_types = SneakerType.all
  end

  def edit
    @sneaker_type = SneakerType.find(params[:id])
  end

  def update
    @sneaker_type = SneakerType.find(params[:id])
    @sneaker_type.update(sneaker_type_params)
    redirect_to admin_sneaker_type_path(sneaker_type.id)
  end

  def destroy
    sneaker_type = SneakerType.find(params[:id])
    sneaker_type.destroy
    redirect_to admin_sneaker_types_path
  end

  private

  def sneaker_type_params
    params.require(:sneaker_type).permit(:sneaker_brand_id, :overview)
  end

end
