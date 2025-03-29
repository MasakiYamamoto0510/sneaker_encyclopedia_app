class Size < ApplicationRecord

  has_many :sneaker_sizes, dependent: :destroy

  validates :size_value, presence: true

end
