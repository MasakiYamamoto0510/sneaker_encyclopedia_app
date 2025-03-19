class SneakerBrand < ApplicationRecord
  has_many :sneaker_types, dependent: :destroy

  validates :name, presence: true
end
