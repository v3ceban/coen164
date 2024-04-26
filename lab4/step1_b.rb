# frozen_string_literal: true

require 'erb'

def shopping_items
  %w[milk egg ham bread]
end

# Class ShoppingList with methods render and output
class ShoppingList
  include ERB::Util

  attr_accessor :items, :template, :date

  def initialize(items, template_file, date = Time.now)
    @date = date
    @items = items
    @template = File.read(template_file)
  end

  def render
    erb_object = ERB.new(@template)
    erb_object.result(binding)
  end

  def output(file)
    File.open(file, 'w') do |f|
      f.write(render)
    end
  end
end

# Instantiate ShoppingList with shopping_items and the path to template file
ShoppingList.new(shopping_items, 'template.erb').output('shoppinglistB.html')
