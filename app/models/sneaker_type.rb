class SneakerType < ApplicationRecord
  belongs_to :sneaker_brand
  has_many :sneakers, dependent: :destroy

  validates :name, presence: true
  validates :overview, allow_blank: true, length: { maximum: 500 }

end
