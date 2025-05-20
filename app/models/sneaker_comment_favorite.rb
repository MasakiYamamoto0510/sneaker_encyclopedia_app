class SneakerCommentFavorite < ApplicationRecord
  # == Associations =============================================
  belongs_to :sneaker_comment
  belongs_to :customer

  # == Validations ==============================================
  validates :customer_id, uniqueness: {scope: :sneaker_comment_id}
end
