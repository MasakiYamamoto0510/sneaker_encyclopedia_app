class Excavation < ApplicationRecord

  belongs_to :customer
  has_one_attached :image

end
