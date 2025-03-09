class Sneaker < ApplicationRecord
  has_one_attached :image
  belongs_to :admin, optional: true
  enum payment_method: {male: 0, female: 1, others: 2}


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
