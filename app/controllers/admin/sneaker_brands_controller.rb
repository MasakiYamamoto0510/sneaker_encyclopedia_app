class Admin::SneakerBrandsController < ApplicationController
  layout 'admin'
  def new
    @sneaker_brand = SneakerBrand.new
  end

  def create
    @sneaker_brand = SneakerBrand.new(sneaker_brand_params)
    if @sneaker_brand.save
      flash[:success] = "投稿に成功しました。"
      redirect_to admin_sneaker_brands_path
    else
      flash.now[:danger] = "投稿に失敗しました。"
      render :new
    end
  end

  def index
    @sneaker_brands = SneakerBrand.all
  end

  def show 
    @sneaker_brand = SneakerBrand.find(params[:id])
    @sneaker_types = @sneaker_brand.sneaker_types

    @sneakers = Sneaker.joins(sneaker_type: :sneaker_brand)
                       .where(sneaker_types: { sneaker_brand_id: @sneaker_brand.id })
                       .order(created_at: :desc)
                       .page(params[:page])
                       .per(25)

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

  def edit
    @sneaker_brand = SneakerBrand.find(params[:id])
  end

  def update
    @sneaker_brand = SneakerBrand.find(params[:id])
    if @sneaker_brand.update(sneaker_brand_params)
       flash[:success] = "投稿に成功しました。"
      redirect_to admin_sneaker_brand_path(@sneaker_brand.id)
    else
      flash.now[:danger] = "投稿に失敗しました。"
      render :edit
    end
  end

  def destroy
    sneaker_brand = SneakerBrand.find(params[:id])
    sneaker_brand.destroy
    flash[:success] = "削除しました"
    redirect_to admin_sneaker_brands_path
  end

  private

  def sneaker_brand_params
    params.require(:sneaker_brand).permit(:name, :overview)
  end
  
end
