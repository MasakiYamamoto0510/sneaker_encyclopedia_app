class Admin::SneakerTypesController < ApplicationController
  layout 'admin'
  def new
    @sneaker_brand = SneakerBrand.find(params[:sneaker_brand_id])
    @sneaker_type = SneakerType.new
  end

  def create
    @sneaker_brand = SneakerBrand.find(params[:sneaker_brand_id])
    @sneaker_type = SneakerType.new(sneaker_type_params)
    @sneaker_type.sneaker_brand_id = @sneaker_brand.id
    if @sneaker_type.save
      flash[:success] = "投稿に成功しました。"
      redirect_to admin_sneaker_brand_path(@sneaker_brand.id)
    else
      flash.now[:danger] = "投稿に失敗しました。"
      render :new
    end
  end

  def index
    @sneaker_types = SneakerType.all
  end

  def show
    @sneaker_type = SneakerType.find(params[:id])
    @sneaker_brand = SneakerBrand.find(params[:sneaker_brand_id])
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

  def edit
    @sneaker_brand = SneakerBrand.find(params[:sneaker_brand_id])
    @sneaker_type = SneakerType.find(params[:id])
  end

  def update
    @sneaker_type = SneakerType.find(params[:id])
    @sneaker_brand = SneakerBrand.find(params[:sneaker_brand_id])
    if @sneaker_type.update(sneaker_type_params)
      flash[:success] = "投稿に成功しました。"
      redirect_to admin_sneaker_brand_sneaker_type_path(@sneaker_brand.id, @sneaker_type.id)
    else
      flash.now[:danger] = "投稿に失敗しました。"
      render :edit 
    end
  end

  def destroy
    sneaker_type = SneakerType.find(params[:id])
    sneaker_brand = SneakerBrand.find(params[:sneaker_brand_id])
    sneaker_type.destroy
    flash[:success] = "削除しました。"
    redirect_to admin_sneaker_brand_path(sneaker_brand.id)
  end

  private

  def sneaker_type_params
    params.require(:sneaker_type).permit(:name, :overview, :sneaker_brand_id)
  end
end
