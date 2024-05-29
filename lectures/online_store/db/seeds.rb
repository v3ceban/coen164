# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.create!(
  name: 'Product 1',
  description: %(Product 1 description),
  image: 'https://picsum.photos/200/300',
  price: 9.99
)

Product.create!(
  name: 'Product 2',
  description: %(Product 2 description),
  image: 'https://picsum.photos/200/300',
  price: 19.99
)

Product.create!(
  name: 'Product 3',
  description: %(Product 3 description),
  image: 'https://picsum.photos/200/300',
  price: 29.99
)

Product.create!(
  name: 'Product 4',
  description: %(Product 4 description),
  image: 'https://picsum.photos/200/300',
  price: 39.99
)
