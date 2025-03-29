class Sneaker < ApplicationRecord
  has_one_attached :image

  belongs_to :admin, optional: true
  belongs_to :sneaker_type, optional: true
  belongs_to :customer, optional: true
  has_many :sneaker_sizes, dependent: :destroy
  has_many :sizes, through: :sneaker_sizes, source: :size, dependent: :destroy

  validates :sneaker_name_en, presence: true 
  #length: { maximum: 150 }, format: { with: /\A[a-zA-Z0-9]+\z/, message: "は英語と数字のみ入力してください" }
  validates :sneaker_name_jp, presence: true 
  #length: { maximum: 150 }, format: { with: /\A[ァ-ヶ0-9]+\z/, message: "はカタカナと数字のみ入力してください" }
  validates :year_of_manufacture, presence: true

  attr_accessor :year
  attr_accessor :month

  before_validation :set_year_of_manufacture
  #before_validationの方が良いのでは？
  
  def set_year_of_manufacture
    if year.present? && month.present? 
      self.year_of_manufacture = Date.new(year.to_i,month.to_i, 1)
    elsif year.present?
      self.year_of_manufacture = Date.new(year.to_i, 1, 1)
      self.sneaker.month_is_unknown = true
      #yearのみセット、　自動的にmonthを1月とか仮の月をセットする　monthに"不明"とか入れると後でデータを並ばせる時とかにややこしくなる。
      #ので仮の値を入れる。で、どっちみち不明フラグ立てるから、viewにおける操作は不明フラグを使って行えば良い
      #不明フラグをたてる
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
