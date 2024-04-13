class Earthquake < ApplicationRecord
  ALLOWED_MAG_TYPES = %w(md ml ms mw me mi mb mlg).freeze

  has_many :comments, dependent: :destroy

  validates :title, :url, :place, :magnitude_type, :latitude, :longitude, presence: true
  validates :magnitude, numericality: { greater_than_or_equal_to: -1.0, less_than_or_equal_to: 10.0 }
  validates :latitude, numericality: { greater_than_or_equal_to: -90.0, less_than_or_equal_to: 90.0 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180.0, less_than_or_equal_to: 180.0 }
  validates :external_id, uniqueness: true
  validates :magnitude_type, inclusion: { in: ALLOWED_MAG_TYPES }
end
