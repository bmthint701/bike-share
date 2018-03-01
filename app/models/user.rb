class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :listings, foreign_key: "renter_id", dependent: :destroy
  has_many :bookings, foreign_key: "renter_id", dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  mount_uploader :photo, PhotoUploader

  # geocoded_by :ip_address,
  # :latitude => :lat, :longitude => :lon
  # after_validation :geocode
end
