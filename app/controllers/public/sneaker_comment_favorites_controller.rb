class Public::SneakerCommentFavoritesController < ApplicationController

  def create
    comment = SneakerComment.find(params[:sneaker_comment_id])
    favorite = comment.sneaker_comment_favorites.new(customer_id: current_customer.id)
    favorite.save
    current_customer.touch
    flash[:success] = "”いいね”！"
    redirect_to sneaker_path(comment.sneaker_id)
    
  end


  def destroy
    comment = SneakerComment.find(params[:sneaker_comment_id])
    favorite = comment.sneaker_comment_favorites.find_by(customer_id: current_customer.id)
    favorite.destroy 
    current_customer.touch
    flash[:danger] = "”いいね”を取り消しました。"
    redirect_to sneaker_path(comment.sneaker_id)
  end

end
