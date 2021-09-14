# frozen_string_literal: true

require 'faker'
puts 'Delete all Admin and User'
Administrator.destroy_all
User.destroy_all

puts 'Generating Administrator and Users'
Administrator.create_with(password: 'password').find_or_create_by(email: 'admin@admin.com')
User.create_with(password: 'password').find_or_create_by(email: 'john@example.com')

3.times do |i|
  User.create_with(password: 'password').find_or_create_by(email: "user_#{i+1}@example")
end


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



Product.delete_all
20.times do
  p = Product.create!(
    name: Faker::Commerce.unique.product_name,
    price: Faker::Number.decimal(l_digits: 2),
    category: Category.all.sample,
    brand: Brand.all.sample
  )
  puts "generating - product - #{p.name}"
  downloaded_image = URI.open("https://source.unsplash.com/700x400/?#{p.name.split.last}")
  p.main_image.attach(io: downloaded_image, filename: "mi_#{p.id}.png")
end



puts 'generating Orders'

Order.destroy_all
25.times do
  Order.create(state: rand(1..3), user: User.all.sample)
  Payment.create(order: Order.last)
  Shipment.create(order: Order.last)
  rand(5).times {|x| OrderItem.create(order: Order.last, product: Product.all.sample)}
end