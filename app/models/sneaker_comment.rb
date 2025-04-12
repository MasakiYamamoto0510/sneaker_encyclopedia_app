class SneakerComment < ApplicationRecord
  
  belongs_to :customer
  belongs_to :sneaker

  validates :comment, presence: true

end
