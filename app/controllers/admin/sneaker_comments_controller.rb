class Admin::SneakerCommentsController < ApplicationController
  layout 'admin'

  def destroy
    @sneaker_comment = SneakerComment.find(params[:id])
    @sneaker_comment.destroy
      redirect_back fallback_location: admin_sneakers_path,
                    flash: { success: 'コメントを削除しました。' }
  end
end
