class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  serialize :image, JSON
  belongs_to :user, optional: true

  validates :name, :category, :description, :condition, :price, presence: true
  validates :description, length: { maximum: 500, too_long: '%<count>s characters is the maximum allowed' }
  validates :name, length: { maximum: 50, too_long: '%<count>s characters is the maximum allowed' }
  validates :price, numericality: { greater_than: 0 }

  CATEGORY = %w[Clothing Shoes Accessories Food Pets Electronics Books Music Software Plants Toys Other].freeze
  CONDITION = %w[New Excellent Good Fair Poor].freeze
end
