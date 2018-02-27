class Listing < ApplicationRecord
  # belongs_to :user
  belongs_to :renter, class_name: 'User'
  has_many :photos
  validates :bike_type, presence: true
  validates :active, presence: true
  validates :hourly_price, presence: true, numericality: true
  validates :listing_name, presence: true
  validates :description, presence: true
  validates :address, presence: true
end
