class Photo < ApplicationRecord
  belongs_to :listing
  validates :photo_url, presence: true
end
