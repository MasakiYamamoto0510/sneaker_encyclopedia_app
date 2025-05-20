class SneakerBrand < ApplicationRecord
  # == Associations =============================================
  has_many :sneaker_types, dependent: :destroy

  # == Validations ==============================================
  validates :name, presence: true
  validates :overview, allow_blank: true, length: { maximum: 500 }

  # == Class Methods ============================================
  def self.search_for(content, method)
    if method == 'perfect'
      SneakerBrand.where(name: content)
    elsif method == 'forward'
      SneakerBrand.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      SneakerBrand.where('name LIKE ?', '%' + content)
    else
      SneakerBrand.where('name LIKE ?', '%' + content + '%')
    end
  end
end
