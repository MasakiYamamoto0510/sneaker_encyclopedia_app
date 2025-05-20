class Customer < ApplicationRecord
  # == Constants ============================================================
  GUEST_EMAIL = "guest_customer@example.com".freeze

  POINT_WEIGHTS = {
    comment_fav_received:  4,
    post:                  3,
    comment:               2,
  }.freeze
  
  # == Devise Modules =======================================================
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # == Attachments ==========================================================
  has_one_attached :profile_image

  # == Associations =========================================================
  has_many :posts, dependent: :destroy
  has_many :sneaker_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :sneaker_comment_favorites, dependent: :destroy
  has_many :sneakers, dependent: :destroy

  has_many :received_comment_favorites,
           through: :sneaker_comments,
           source:  :sneaker_comment_favorites

  # == Validations ==========================================================
  validates :name, presence: true
  validates :email, presence: true
  validates :self_introduction, allow_blank: true, length: { maximum: 500 }

  # == Class Methods ========================================================
  def self.guest
    find_or_create_by!(email: GUEST_EMAIL) do |c|
      c.password = SecureRandom.urlsafe_base64
      c.name     = "GuestCustomer"
    end
  end

  def self.search_for(content, method)
    case method
    when 'perfect'   then where(name: content)
    when 'forward'   then where('name LIKE ?', "#{content}%")
    when 'backward'  then where('name LIKE ?', "%#{content}")
    else                  where('name LIKE ?', "%#{content}%")
    end
  end
  
  # == Instance Methods =====================================================
  def guest?
    email == GUEST_EMAIL
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def point
    c_fav_pts   = received_comment_favorites.size * POINT_WEIGHTS[:comment_fav_received]
    post_pts    = posts.size                      * POINT_WEIGHTS[:post]
    comment_pts = sneaker_comments.size           * POINT_WEIGHTS[:comment]

    c_fav_pts + post_pts + comment_pts
  end

  def change_point!(action, delta = +1)
    self.point ||= 0
    self.point += POINT_WEIGHTS[action] * delta
  end
end
