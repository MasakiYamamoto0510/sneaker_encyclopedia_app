class Public::FavoritesController < ApplicationController

  def create
    sneaker = Sneaker.find(params[:sneaker_id])
    favorite = current_customer.favorites.new(sneaker_id: sneaker.id)
    favorite.save
    current_customer.touch
    flash[:success] = "”いいね”！"
    redirect_to sneaker_path(sneaker)
  end

  def destroy
    sneaker = Sneaker.find(params[:sneaker_id])
    favorite = current_customer.favorites.find_by(sneaker_id: sneaker.id)
    favorite.destroy
    current_customer.touch
    flash[:danger] = "”いいね”を取り消しました。"
    redirect_to sneaker_path(sneaker)
  end

end
