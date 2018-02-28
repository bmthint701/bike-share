# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

user_id = [1, 3, 4]

puts 'Creating 100 listings...'
100.times do
listing = Listing.create(
  address: Faker::Address.city,
  bike_type: ["Fixed-Gear", "Motorized", "Variable-Gear"].sample,
  renter_id: rand(1..10),
  hourly_price: rand(300..600),
  listing_name: Faker::Company.name,
  description: Faker::ChuckNorris.fact,
  active: true
  )
end


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
