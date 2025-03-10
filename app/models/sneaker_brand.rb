class SneakerBrand < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :sneakers, dependent: :destroy
end
