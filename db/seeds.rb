# frozen_string_literal: true

require 'faker'
Administrator.destroy_all
User.destroy_all

Administrator.create_with(password: 'password').find_or_create_by(email: 'admin@admin.com')
User.create_with(password: 'password').find_or_create_by(email: 'john@example.com')

puts 'Generating Brand'
Brand.destroy_all
4.times do
  Brand.create(
    name: Faker::Device.manufacturer
  )
end

puts 'Generating Categories'
Category.destroy_all
4.times do
  Category.create(
    name: Faker::Commerce.department(max: 1)
  )
end

categories = Category.all
brands = Brand.all

Product.delete_all
15.times do
  p = Product.create!(
    name: Faker::Commerce.unique.product_name,
    price: Faker::Number.decimal(l_digits: 2),
    category: categories[rand(4)],
    brand: brands[rand(4)]
  )
  puts "generating - product - #{p.name}"
  downloaded_image = URI.open("https://source.unsplash.com/700x400/?#{p.name.split.last}")
  p.main_image.attach(io: downloaded_image, filename: "mi_#{p.id}.png")
end
