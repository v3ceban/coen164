# frozen_string_literal: true

# Controller for the products
class Product < ApplicationRecord
  validates :name, :description, :image, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :image, format: { with: /\.(gif|jpg|png)\Z/i, message: 'must be a URL for GIF, JPG or PNG image.' }
  validates :name, uniqueness: true
end
