class Admin < ApplicationRecord
  # == Device Modules =================================================================
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, # :registerable,:recoverable,
          :rememberable, :validatable

  devise authentication_keys: [:email]

  # == Attachments ====================================================================
  has_one_attached :admin_profile_image

  # == Associations ===================================================================
  has_many :sneakers, dependent: :destroy

  # == Instsnce Methods ===============================================================
  def get_admin_profile_image(width, height)
    unless admin_profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      admin_profile_image.attach(io: File.open(file_path), 
                                 filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    admin_profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
