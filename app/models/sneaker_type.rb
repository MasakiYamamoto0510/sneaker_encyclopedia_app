class SneakerType < ApplicationRecord
  # == Associations =============================================
  belongs_to :sneaker_brand
  has_many :sneakers, dependent: :destroy

  # == Validations ==============================================
  validates :name, presence: true
  validates :overview, allow_blank: true, length: { maximum: 500 }

  # == Class Methods ============================================
  def self.search_for(content, method)
    if method == 'perfect'
      SneakerType.where(name: content)
    elsif method == 'forward'
      SneakerType.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      SneakerType.where('name LIKE ?', '%' + content)
    else
      SneakerType.where('name LIKE ?', '%' + content + '%')
    end
  end
end
