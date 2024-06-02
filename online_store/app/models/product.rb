# frozen_string_literal: true

# Product model
class Product < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  mount_uploader :image, ImageUploader
  serialize :image, JSON
  belongs_to :user, optional: true
  has_many :line_items

  validates :name, :category, :description, :condition, :price, presence: true
  validates :description, length: { maximum: 500, too_long: '%<count>s characters is the maximum allowed' }
  validates :name, length: { maximum: 50, too_long: '%<count>s characters is the maximum allowed' }
  validates :price, numericality: { greater_than: 0 }

  CATEGORY = %w[Clothing Shoes Accessories Food Pets Electronics Books Music Software Plants Toys Other].freeze
  CONDITION = %w[New Excellent Good Fair Poor].freeze

  def self.search(search)
    where('name LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%")
  end

  private

  def not_refereced_by_any_line_item
    return if line_items.empty?

    errors.add(:base, 'Line items present')
    throw :abort
  end
end
