class SneakerCommentFavorite < ApplicationRecord

  belongs_to :sneaker_comment
  belongs_to :customer

  validates :customer_id, uniqueness: {scope: :sneaker_comment_id}

end
