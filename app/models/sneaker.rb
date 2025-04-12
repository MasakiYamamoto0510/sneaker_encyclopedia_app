class Sneaker < ApplicationRecord
  has_one_attached :image

  belongs_to :admin
  belongs_to :customer, optional: true
  belongs_to :sneaker_type
  has_many :posts, dependent: :destroy
  has_many :sneaker_comments, dependent: :destroy
  has_many :sneaker_sizes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :sizes, through: :sneaker_sizes, source: :size, dependent: :destroy

  validates :sneaker_name_en, presence: true, length: { maximum: 150 }, format: { without: /[\p{Hiragana}\p{Katakana}\p{Han}]/, message: "はひらがなとカタカナと漢字では入力できません" }
  validates :sneaker_name_jp, presence: true, length: { maximum: 150 }, format: { without: /[\p{Hiragana}\p{Han}a-zA-Z]/, message: "はひらがなと漢字、半角英字では入力できません" }
  validates :sneaker_type_id, presence: true
  validates :year_of_manufacture, presence: true
  validates :size_ids, presence: true
  validates :image, presence: true

  attr_accessor :year
  attr_accessor :month

  scope :latest, -> { order(year_of_manufacture: :desc) }
  scope :old, -> { order(year_of_manufacture: :asc) }


  before_validation :set_year_of_manufacture
  
  def set_year_of_manufacture
    if year.present? && month.present? 
      self.year_of_manufacture = Date.new(year.to_i,month.to_i, 1)
    elsif year.present?
      self.year_of_manufacture = Date.new(year.to_i, 1, 1)
      month_is_unknown = true
    end
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Sneaker.where(sneaker_name_en: content).or(Sneaker.where(sneaker_name_jp: content))
    elsif method == 'forward'
      Sneaker.where('sneaker_name_en LIKE ? OR sneaker_name_jp LIKE ?', content + '%', content + '%')
    elsif method == 'backward'
      Sneaker.where('sneaker_name_en LIKE ? OR sneaker_name_jp LIKE ?','%' + content, '%' + content)
    else
      Sneaker.where('sneaker_name_en LIKE ? OR sneaker_name_jp LIKE ?', '%' + content + '%', '%' + content + '%') 
    end
  end

end
