# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Creating 10 fake restaurants...'
10.times do
user = User.create([{
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  phone: Faker::PhoneNumber.phone_number,
  email: Faker::Internet.email
  encrypted_password: "123456"


  }])

puts 'Creating 100 listings...'
100.times do
listing = Listing.create([{

address: Faker::Address.city
bike_type: "Fixed-Gear"
renter_id: rand(1..10)
hourly_price: Name.name


}

  ])
create_table "listings", force: :cascade do |t|
    t.string "address"
    t.string "bike_type"
    t.integer "renter_id"
    t.boolean "active"
    t.text "instruction"
    t.integer "hourly_price"
    t.string "listing_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false

create_table "bookings", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "listing_id"
    t.integer "renter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_bookings_on_listing_id"
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
