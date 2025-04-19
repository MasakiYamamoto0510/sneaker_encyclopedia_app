class Customer < ApplicationRecord
  attr_accessor :point
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  POINT_WEIGHTS = {
    comment_fav_received:  4,
    post:                  3,
    comment:               2,
  }.freeze
   
  has_one_attached :profile_image

  has_many :posts, dependent: :destroy
  has_many :sneaker_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :sneaker_comment_favorites, dependent: :destroy
  has_many :sneakers, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :self_introduction, allow_blank: true, length: { maximum: 500 }

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Customer.where(name: content)
    elsif method == 'forward'
      Customer.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      Customer.where('name LIKE ?', '%' + content)
    else
      Customer.where('name LIKE ?', '%' + content + '%')
    end
  end

  def self.with_point
    customers = self.all.each { |customer| customer.touch }
    customers.sort_by { |customer| customer.point }.reverse
  end

  def change_point!(action, delta = +1)
    self.point ||= 0
    self.point += POINT_WEIGHTS[action] * delta
  end
end
