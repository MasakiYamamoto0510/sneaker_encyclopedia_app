class Favorite < ApplicationRecord
  # == Associations ======================================
  belongs_to :customer
  belongs_to :sneaker
  
  # == Validations =======================================
  validates :customer_id, uniqueness: {scope: :sneaker_id}
end
