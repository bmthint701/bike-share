class Review < ApplicationRecord
  belongs_to :listing
  validates :content, length: { minimum: 5 }, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }, presence: true
end
