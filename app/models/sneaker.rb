class Sneaker < ApplicationRecord
  has_one_attached :image
  belongs_to :admin

  def get_sneaker_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      sneaker_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    sneaker_image.variant(resize_to_limit: [width,height]).processed
  end
end
