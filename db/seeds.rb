# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

user_id = [1, 3, 4]

puts 'Creating 10 fake users...'
10.times do |x|
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    encrypted_password: "password"

    )
end
# puts 'Creating 100 listings...'
# 100.times do
# listing = Listing.create(
#   address: Faker::Address.city,
#   bike_type: ["Fixed-Gear", "Motorized", "Variable-Gear"].sample,
#   renter_id: rand(1..10),
#   hourly_price: rand(300..600),
#   listing_name: Faker::Company.name,
#   description: Faker::ChuckNorris.fact,
#   active: true
#   )
# end

# puts 'Creating 30 bookings...'
# 10.times do
# bookings = Booking.create(

# start_date: Faker::Date.between_except(1.day.from_now, 13.day.from_now, Date.today),
# end_date: Faker::Date.between_except(14.day.from_now, 2.month.from_now, Date.today),
# renter_id: rand(1..3),
# created_at: Faker::Time.between(2.month.ago, Date.today, :day), #=> "2014-09-18 16:28:13 -0700"
# updated_at: Faker::Time.between(DateTime.now - 1, DateTime.now),
# listing_id: rand(4..100),
# accepted: true

# )
# end



# require 'faker'

# puts 'Creating 100 fake restaurants...'
# 100.times do
#   restaurant = Restaurant.new(
#     name:    Faker::Company.name,
#     address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
#     rating:  (0..5).to_a.sample
#   )
#   restaurant.save!
# end
# puts 'Finished!'
