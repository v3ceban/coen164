# frozen_string_literal: true

# Product model
class Product < ApplicationRecord
  validates(:name, :description, :image, presence: true)
  validates(:price, presence: true, numericality: { greater_than_or_equal_to: 0 })
  validates :image, format: { with: %r{\.(jpg|png|gif)\Z|\Ahttp(s)?://.*\z} }
end
