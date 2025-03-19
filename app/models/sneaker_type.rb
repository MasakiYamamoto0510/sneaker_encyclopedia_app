class SneakerType < ApplicationRecord
  belongs_to :sneaker_brand
  has_many :sneakers

  validates :overview, presence: true

end
