# frozen_string_literal: true

# Model for lineitems
class Lineitem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
end
