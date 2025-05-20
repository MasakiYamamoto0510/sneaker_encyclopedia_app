class Size < ApplicationRecord
  # == Associations ======================================
  has_many :sneaker_sizes, dependent: :destroy
  has_many :sneakers, through: :sneaker_sizes, 
                      source: :sneaker, dependent: :destroy

  # == Validations =======================================
  validates :size_value, presence: true
end
