class Public::FavoritesController < ApplicationController

  def create
    @sneaker = Sneaker.find(params[:sneaker_id])
    current_customer.favorites.find_or_create_by(sneaker_id: @sneaker.id)
    render 'public/favorites/toggle'
  end

  def destroy
    @sneaker = Sneaker.find(params[:sneaker_id])
    favorite = current_customer.favorites.find_by(sneaker_id: @sneaker.id)
    favorite&.destroy
    render 'public/favorites/toggle'
  end

end
