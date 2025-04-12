class Public::SneakerCommentsController < ApplicationController

  def create
    @sneaker = Sneaker.find(params[:sneaker_id])
    @comment = SneakerComment.new(sneaker_comment_params)
    @comment.customer_id = current_customer.id
    @comment.sneaker_id = @sneaker.id
    if @comment.save
      flash[:success] = "投稿に成功しました。"
      redirect_to sneaker_path(@sneaker)
    else
      flash.now[:danger] = "投稿に失敗しました。"
      render 'public/sneakers/show'
    end
  end

  def destroy
    SneakerComment.find(params[:id]).destroy
    flash[:success] = "削除しました。"
    redirect_to sneaker_path(params[:sneaker_id])
  end
  
  private

  def sneaker_comment_params
    params.require(:sneaker_comment).permit(:comment)
  end

end
