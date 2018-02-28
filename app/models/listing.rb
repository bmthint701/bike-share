class Listing < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :renter, class_name: 'User'
  validates :bike_type, presence: true
  validates :active, presence: true
  validates :hourly_price, presence: true, numericality: true
  validates :listing_name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  mount_uploader :photo, PhotoUploader
end
