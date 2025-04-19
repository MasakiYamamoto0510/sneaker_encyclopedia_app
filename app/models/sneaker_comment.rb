class SneakerComment < ApplicationRecord
  
  belongs_to :customer
  belongs_to :sneaker
  has_many :sneaker_comment_favorites, dependent: :destroy

  validates :comment, presence: true

  after_create  -> { customer.change_point!(:comment,  +1) }
  after_destroy -> { customer.change_point!(:comment,  -1) }

  def favorited_by?(customer)
    sneaker_comment_favorites.exists?(customer_id: customer.id)
  end

end
