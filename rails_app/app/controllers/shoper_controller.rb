# frozen_string_literal: true

# Controller for the shop
class ShoperController < ApplicationController
  def index
    @products = Product.all
  end
end
