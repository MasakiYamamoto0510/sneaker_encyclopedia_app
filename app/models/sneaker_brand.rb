class SneakerBrand < ApplicationRecord
  has_many :sneaker_types, dependent: :destroy

  validates :name, presence: true
  validates :overview, allow_blank: true, length: { maximum: 500 }
  
end
