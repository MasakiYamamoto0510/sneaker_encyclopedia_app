class Admin::ExcavationsController < ApplicationController
  layout 'admin'
 
  def index
    @excavations = Excavation.all
  end

  def edit
    @excavation = Excavation.find(params[:id])
    @sneaker_brands = SneakerBrand.all
  end

  def update
    @excavation = Excavation.find(params[:id])
    @sneaker = current_admin.sneakers.build(sneaker_params)
    if params.dig(:excavation, :approval) == "true"
      @excavation.update(admin_id: current_admin.id)
    elsif params.dig(:excavation, :approval) == "false"
      @excavation.update(admin_id: nil)
    end
    #if @sneaker.valid? && @excavation.valid?
      #@sneaker.save
      #@excavation.save
      redirect_to admin_dashboards_path
    #else
      #render :edit
    #end
  end

  def destroy
      @excavation = Excavation.find(params[:id])
      @excavation.destroy
      redirect_to admin_dashboards_path, notice: '新規発掘を削除しました。'
  end

  private
  def sneaker_params 
    params.require(:excavation).permit(:image, :admin_id, :customer_id, :sneaker_brand_id, :sneaker_name, :overview, :year, :month, :color, :size_sex, :size_country, :numerical_size)
  end
end