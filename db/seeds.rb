# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Brand.destroy_all
4.times do
  Brand.create(
    name: Faker::Device.manufacturer
  )
end

Category.destroy_all
4.times do
  Category.create(
    name: Faker::Commerce.department(max: 1)
  )
end

categories = Category.all
brands = Brand.all

Product.delete_all
10.times do
  Product.create!(
    name: Faker::Game.title,
    price: Faker::Commerce.price,
    category: categories[rand(4)],
    brand: brands[rand(4)]
  )
end



