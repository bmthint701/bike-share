class ConvertRenterIDsToFk < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :bookings, :users, column: :renter_id
    add_foreign_key :listings, :users, column: :renter_id
  end
end
