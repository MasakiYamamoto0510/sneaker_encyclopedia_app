class Admin::PostsController < ApplicationController
  layout 'admin'

  def show
    @post = Post.find(params[:id])
    @sneaker = @post.sneaker
  end

  def index
    @posts = Post.page(params[:page])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:success] = "削除しました。"
    redirect_to admin_posts_path
  end
end
