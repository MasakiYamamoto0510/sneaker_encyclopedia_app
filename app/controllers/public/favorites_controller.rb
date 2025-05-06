class Public::FavoritesController < ApplicationController
  before_action :set_sneaker

  def create
    current_customer.favorites.find_or_create_by!(sneaker: @sneaker)
    respond_to do |format|
      format.js
      format.html { redierct_to sneaker_path(@sneaker) }
    end
  end

  def destroy
    current_customer.favorites.find_by(sneaker: @sneaker)&.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to sneaker_path(@sneaker) }
    end
  end

  private
  def set_sneaker
    @sneaker = Sneaker.find(params[:sneaker_id])
  end
end
