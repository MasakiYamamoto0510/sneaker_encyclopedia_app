class SneakerType < ApplicationRecord
  belongs_to :sneaker_brand
  has_many :sneakers

  validates :sneaker_type_name, presence: true
  validates :overview, allow_blank: true, length: { maximum: 250 }

end
