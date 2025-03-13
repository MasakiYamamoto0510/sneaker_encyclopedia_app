class SneakerBrand < ApplicationRecord

  has_many :sneakers, dependent: :destroy
end
