class Public::SneakersController < ApplicationController
  def new
    @sneaker_types = SneakerType.all
    @sneaker = Sneaker.new
  end

  def create
    @sneaker = Sneaker.new(sneaker_params)
    @sneaker.customer_id = current_customer.id
    @sneaker.save
    flash[:notice] = "投稿に成功しました。"
    redirect_to mypage_path
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
    @comment = SneakerComment.new

    @comments = @sneaker.sneaker_comments
                        .order(created_at: :desc)
                        .page(params[:comments_page])
                        
    @related_posts = @sneaker.posts
                             .order(created_at: :desc)
                             .page(params[:posts_page])
  end

  private

  def sneaker_params 
    params.require(:sneaker).permit(:image, :admin_id, :customer_id, :sneaker_type_id, :sneaker_name_en, :sneaker_name_ja, :year, :month )
  end

end
