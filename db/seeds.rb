# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Category.destroy_all
Product.destroy_all




a = User.create!(email: "edu@edu.com", password: "123456")
b = User.create!(email: "sonia@sonia.com", password: "123456")

x = Category.create!(name: "Bike")
y = Category.create!(name: "Home Appliances")
z = Category.create!(name: "I don't know what that is")


Product.create!(user: a, category: x, product_picture: "", product_title: "Best bike ever", product_condition: "New", product_description: "Nice bike, nice ride")
Product.create!(user: a, category: y, product_picture: "", product_title: "Amazing blender", product_condition: "Used", product_description: "A juice a day keeps the doctor away")
Product.create!(user: b, category: z, product_picture: "", product_title: "I named that Smuffle, because yes", product_condition: "New", product_description: "Always brought me lots of fun trying to understand what that is =)")
