class Public::SneakerCommentFavoritesController < ApplicationController
  before_action :set_comment

  def create
    current_customer.sneaker_comment_favorites.find_or_create_by!(sneaker_comment: @comment)
    respond_to do |format|
      format.js   
      format.html { redirect_back fallback_location: sneaker_path(@comment.sneaker) }
    end
  end

  def destroy
    current_customer.sneaker_comment_favorites.find_by(sneaker_comment: @comment)&.destroy
    respond_to do |format|
      format.js   
      format.html { redirect_back fallback_location: sneaker_path(@comment.sneaker) }
    end
  end

  private
  def set_comment
    @comment = SneakerComment.find(params[:sneaker_comment_id])
  end
end
