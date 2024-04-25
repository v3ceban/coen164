# frozen_string_literal: true

require 'erb'

# Build template data class
class Product
  attr_accessor :features

  def initialize(code, name, desc, cost)
    @code = code
    @name = name
    @desc = desc
    @cost = cost
    @features = []
  end

  def add_feature(feature)
    @features << feature
  end

  # Support templating of member data.
  def get_binding
    binding
  end
end

# Create template.
template = %{
  <html>
    <head><title>Ruby Toys -- <%= @name %></title></head>
    <body>
      <h1><%= @name %> (<%= @code %>)</h1>
      <p><%= @desc %></p>
      <ul>
        <% @features.each do |f| %>
          <li><b><%= f %></b></li>
        <% end %>
      </ul>
      <p>
          <% if @cost < 10 %>
             <b>Only <%= @cost %>!!!</b>
          <% else %>
             Call for a price, today!
           <% end %>
      </p>
  </body>
  </html>
}.gsub(/^  /, '')

rhtml = ERB.new(template)

# Set up template data.
toy = Product.new('ER-1000', 'Effective Ruby', 'Rubiests Best Friend!',
                  49.95)
toy.add_feature('How to avoid pitfalls associated with Ruby')
toy.add_feature('What you should know about inheritance')
toy.add_feature('Powerful metaprogramming approaches')
toy.add_feature('Matz signature')
toy.add_feature("Ruby interpreter's internals.")

p toy.features

# Produce result.
puts rhtml.result(toy.get_binding)
