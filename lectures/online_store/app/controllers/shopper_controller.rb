# frozen_string_literal: true

# Controller for the shop
class ShopperController < ApplicationController
  def index
    @products = Product.all
  end
end
