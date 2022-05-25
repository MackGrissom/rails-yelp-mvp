# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts "Cleaning database"
Restaurant.destroy_all

puts "Creating Restaurants"

10.times do
  restaurant = Restaurant.create(name: Faker::Company.name, address: Faker::Address.city, rating: Restaurant::RATING.sample, chef_name: Faker::Name.name)
  5.times do
    Review.create(content: Faker::Restaurant.review, restaurant: restaurant)
    puts "#{Review.count} reviews created for #{restaurant.name}"
  end
  puts restaurant.name
end