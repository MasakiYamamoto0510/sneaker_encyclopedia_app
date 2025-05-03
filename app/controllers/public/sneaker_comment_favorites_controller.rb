class Public::SneakerCommentFavoritesController < ApplicationController
  before_action :set_comment

  def create
    @favorite = @comment.sneaker_comment_favorites
                        .find_or_create_by(customer: current_customer)
    respond_to do |format|
      format.js { render :toggle }
    end
  end

  def destroy
    @favorite = @comment.sneaker_comment_favorites.find_by(customer: current_customer)
    @favorite&.destroy 
    respond_to do |format|
      format.js { render :toggle }
    end
  end

  private

  def set_comment
    @comment = SneakerComment.find(params[:sneaker_comment_id])
  end
end
