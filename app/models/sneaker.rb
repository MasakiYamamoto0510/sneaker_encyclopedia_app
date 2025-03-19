class Sneaker < ApplicationRecord
  has_one_attached :image

  belongs_to :admin, optional: true
  belongs_to :sneaker_type, optional: true
  belongs_to :customer, optional: true

  validates :sneaker_name_en, allow_blank: true, length: { maximum: 150 }, format: { with: /\A[a-zA-Z0-9]+\z/, message: "は英語と数字のみ入力してください" }
  validates :sneaker_name_jp, allow_blank: true, length: { maxumum: 150 }, format: { with: /\A[ァ-ヶ0-9]+\z/, message: "はカタカナと数字のみ入力してください" }
  #validates :year_of_manufactur

  enum size_sex: {not_clear: 0, male: 1, female: 2}
  enum size_country: ISO3166::Country.codes

  attr_accessor :year
  attr_accessor :month

  before_save :set_year_of_manufacture
  
  def set_year_of_manufacture
    if year && month 
      self.year_of_manufacture = Date.new(year.to_i,month.to_i,1)
    end
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [100, 100]).processed
  end
end
