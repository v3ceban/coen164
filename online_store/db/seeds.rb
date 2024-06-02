# frozen_string_literal: true

admin = User.create!(name: 'Admin', email: 'admin@example.com', password: '123456', admin: true)
user = User.create!(name: 'User', email: 'user@example.com', password: '123456', admin: false)

Product.create!(
  name: 'Funny Book',
  category: 'Books',
  description: 'Book ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id. Cum sociis natoque penatibus et magnis dis parturient montes. ',
  condition: 'New',
  price: 25.00,
  image: Rails.root.join('./app/assets/images/img6.jpg').open,
  user_id: admin.id
)

Product.create!(
  name: 'Cat Toy',
  category: 'Toys',
  description: 'Toy ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id. Cum sociis natoque penatibus et magnis dis parturient montes. ',
  condition: 'Poor',
  price: 30.00,
  image: Rails.root.join('./app/assets/images/img5.jpg').open,
  user_id: user.id
)

Product.create!(
  name: 'Red Dress ',
  category: 'Clothing',
  description: 'Dress ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id. Cum sociis natoque penatibus et magnis dis parturient montes. ',
  condition: 'Excellent',
  price: 80.00,
  image: Rails.root.join('./app/assets/images/img4.jpg').open,
  user_id: admin.id
)

Product.create!(
  name: 'Macbook ',
  category: 'Electronics',
  description: 'Book ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id. Cum sociis natoque penatibus et magnis dis parturient montes. ',
  condition: 'Fair',
  price: 950.00,
  image: Rails.root.join('./app/assets/images/img3.jpg').open,
  user_id: admin.id
)

Product.create!(
  name: 'Electric Guitar',
  category: 'Music',
  description: 'Guitar ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id. Cum sociis natoque penatibus et magnis dis parturient montes. ',
  condition: 'Excellent',
  price: 800.00,
  image: Rails.root.join('./app/assets/images/img2.jpg').open,
  user_id: admin.id
)

Product.create!(
  name: 'Cool Shoes',
  category: 'Shoes',
  description: 'Shoe ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id. Cum sociis natoque penatibus et magnis dis parturient montes. ',
  condition: 'New',
  price: 100.00,
  image: Rails.root.join('./app/assets/images/img1.jpg').open,
  user_id: user.id
)
