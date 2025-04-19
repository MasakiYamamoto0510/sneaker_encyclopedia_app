class SneakerCommentFavorite < ApplicationRecord

  belongs_to :sneaker_comment
  belongs_to :customer

  validates :customer_id, uniqueness: {scope: :sneaker_comment_id}

  after_create  -> { sneaker_comment.customer.change_point!(:comment_fav_received, +1) }
  after_destroy -> { sneaker_comment.customer.change_point!(:comment_fav_received, -1) }
  
end
