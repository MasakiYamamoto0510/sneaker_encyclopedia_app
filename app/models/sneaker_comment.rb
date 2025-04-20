class SneakerComment < ApplicationRecord
  
  belongs_to :customer
  belongs_to :sneaker
  has_many :sneaker_comment_favorites, dependent: :destroy

  validates :comment, presence: true

  def favorited_by?(customer)
    sneaker_comment_favorites.exists?(customer_id: customer.id)
  end

end
