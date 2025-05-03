class Public::FavoritesController < ApplicationController
  before_action :set_sneaker

  def create
    current_customer.favorites.find_or_create_by(sneaker_id: @sneaker.id)
    render 'public/favorites/toggle'
  end

  def destroy
    favorite = current_customer.favorites.find_by(sneaker_id: @sneaker.id)
    favorite&.destroy
    render 'public/favorites/toggle'
  end

  private

  def set_sneaker
    @sneaker = Sneaker.find(params[:sneaker_id])
  end

end
