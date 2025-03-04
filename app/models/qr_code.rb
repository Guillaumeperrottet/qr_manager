class QrCode < ApplicationRecord
  belongs_to :user
  belongs_to :linkable, polymorphic: true, optional: true

  validates :title, presence: true
  validates :url, presence: true

  # Scope for active QR codes
  scope :active, -> { where(active: true) }

  # Track QR code visits
  def track_visit!
    self.increment!(:visits_count)
  end

  # Generate a short unique identifier for this QR code
  def short_code
    "QR#{id.to_s(36).upcase}"
  end
end
