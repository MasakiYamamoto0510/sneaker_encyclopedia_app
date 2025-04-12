class Public::PostsController < ApplicationController
  before_action :is_matching_login_customer, only: [:edit, :update]

  def new
    @post = Post.new
    @sneakers = Sneaker.all
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      flash[:success] = "投稿に成功しました。"
      redirect_to posts_path
    else
      flash.now[:danger] = "投稿に失敗しました。"
      @sneakers = Sneaker.all
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @sneakers = Sneaker.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "更新に成功しました。"
    redirect_to post_path(@post.id)
    else
      flash.now[:danger] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "削除しました。"
    redirect_to posts_path
  end


  private 

  def post_params
    params.require(:post).permit(:image, :title, :body, :sneaker_id)
  end

  def is_matching_login_customer
    @post = Post.find(params[:id])
    unless @post.customer_id == current_customer.id
      redirect_to posts_path
    end
  end

end
