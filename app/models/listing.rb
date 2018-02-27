class Listing < ApplicationRecord
  belongs_to :renter, class_name: 'User'
  validates :bike_type, presence: true
  validates :active, presence: true
  validates :hourly_price, presence: true, numericality: true
  validates :listing_name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  mount_uploader :photo, PhotoUploader
end
