class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :renter, class_name: 'User'
  validates :start_date, :end_date, presence: true
  validate :end_after_start

private

  def end_after_start
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
