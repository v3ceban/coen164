# frozen_string_literal: true

# Model for the carts
class Cart < ApplicationRecord
  has_many :lineitems, dependent: :destroy
end
