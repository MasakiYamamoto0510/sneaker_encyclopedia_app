class Admin::SneakersController < ApplicationController
  layout 'admin'

  def new
    @sneaker_types = SneakerType.all
    @sizes = Size.all
    @sneaker = Sneaker.new
  end

  def create
    @sneaker = Sneaker.new(sneaker_params)
    @sneaker.admin_id = current_admin.id
    @sneaker.sneaker_type_id = params[:sneaker][:sneaker_type_id]
    @sneaker.is_publish = true
    if @sneaker.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to admin_sneakers_path
    else
      @sneaker_types = SneakerType.all
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def index
    @sneaker_brands = SneakerBrand.all
    @sneakers = Sneaker.where(is_publish: true)
  end

  def unpublished
    @sneakers = Sneaker.where(is_publish: false)
  end

  def show
    @sneaker = Sneaker.find(params[:id])
    @sneaker_brand = @sneaker.sneaker_type.sneaker_brand
  end

  def edit
    @sneaker = Sneaker.find(params[:id])
    @sneaker_types = SneakerType.all
  end

  def update
    @sneaker = Sneaker.find(params[:id])
    if @sneaker.update(sneaker_params)
      flash[:notice] = "投稿に成功しました。"
      redirect_to admin_sneaker_path(@sneaker.id)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :edit
    end
  end

  def destroy
    sneaker = Sneaker.find(params[:id])
    sneaker.destroy
    redirect_to admin_sneakers_path
  end

  def judge
    @sneaker = Sneaker.find(params[:id])
    @sneaker_brands = SneakerBrand.all
  end

  def publish
    @sneaker = Sneaker.find(params[:id]) 
    #if @sneaker.valid? && @excavation.valid?
      @sneaker.update(is_publish: true)
    
      redirect_to admin_sneaker_path(@sneaker.id) #すぐに詳細で承認つけれるように
    #else
      #render :edit
    #end
  end

  private

  def sneaker_params 
    params.require(:sneaker).permit(:image, :admin_id, :customer_id, :sneaker_brand_id, :sneaker_type_id, :is_publish, :sneaker_name_en, :sneaker_name_jp, :year, :month,  size_ids: [] )
  end

end
