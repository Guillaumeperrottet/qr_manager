class Restaurant < ApplicationRecord
  belongs_to :user
  has_one :qr_code, as: :linkable, dependent: :nullify
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :image, content_type: ['image/png', 'image/jpeg', 'image/jpg'],
                   size: { less_than: 5.megabytes }

  # Scope for filtering by category
  scope :by_category, ->(category) { where(category: category) if category.present? }
  scope :by_price_level, ->(level) { where(price_level: level) if level.present? }
end
