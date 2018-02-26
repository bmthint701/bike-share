class Listing < ApplicationRecord
  belongs_to :user
  has_many :photos
  validates :listings, presence: true
  validates :bike_type, presence: true
  validates :active, presence: true
  validates :hourly_price, prensence: true, numericality: true
  validates :listing_name, presence: true
  validates :description, presence: true
end
