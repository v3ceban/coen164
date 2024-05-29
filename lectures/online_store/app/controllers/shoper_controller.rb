class ShoperController < ApplicationController
  def index
    @products = Product.all
  end
end
