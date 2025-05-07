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
    if @sneaker.save
      flash[:success] = "投稿に成功しました。"
      redirect_to admin_sneakers_path
    else
      @sneaker_types = SneakerType.all
      flash.now[:danger] = "投稿に失敗しました。"
      render :new
    end
  end

  def index
    @sneaker_brands = SneakerBrand.all

    sort_param = params[:sort]

    @sneakers = Sneaker.page(params[:page]).per(25)

    case sort_param
    when "latest"
      @sneakers = @sneakers.latest
    when "old"
      @sneakers = @sneakers.old
    else
      @sneakers = @sneakers.latest
    end
  end

  def show
    @sneaker = Sneaker.find(params[:id])
    @sneaker_brand = @sneaker.sneaker_type.sneaker_brand

    @comments = @sneaker.sneaker_comments
                       .order(created_at: :desc)
                       .page(params[:comments_page])

    @related_posts = @sneaker.posts
                             .order(created_at: :desc)
                             .page(params[:posts_page])

  end

  def edit
    @sneaker = Sneaker.find(params[:id])
    @sneaker_types = SneakerType.all
  end

  def update
    @sneaker = Sneaker.find(params[:id])
    if @sneaker.update(sneaker_params)
      flash[:success] = "投稿に成功しました。"
      redirect_to admin_sneaker_path(@sneaker.id)
    else
      flash.now[:danger] = "投稿に失敗しました。"
      render :edit
    end
  end

  def destroy
    sneaker = Sneaker.find(params[:id])
    sneaker.destroy
    flash[:success] = "削除しました。"
    redirect_to admin_sneakers_path
  end

  private

  def sneaker_params 
    params.require(:sneaker).permit(:image, :admin_id, :customer_id, :sneaker_brand_id, :sneaker_type_id, :sneaker_name_en, :sneaker_name_jp, :year, :month,  size_ids: [] )
  end

end
