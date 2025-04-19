class Favorite < ApplicationRecord

  belongs_to :customer
  belongs_to :sneaker

  validates :customer_id, uniqueness: {scope: :sneaker_id}


end
