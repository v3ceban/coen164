# frozen_string_literal: true

require 'erb'

def shopping_items
  %w[milk egg ham bread]
end

def template
  %{
     <html>
     <head>
     </head>
<body>
<h1> Shopping List for <%= @date.strftime('%A, %d, %B, %Y')%>
<p> You need to buy </p>
<ul>
<% for item in @items %>
   <li> <%= item %> </li>
<% end %>
</ul>
</body>
     </html>
}
end

class ShoppingList
  include ERB::Util

  attr_accessor :items, :template, :date

  def initialize(items, temp, date = Time.now)
    @date = date
    @items = items
    @template = temp
  end

  def render
    erb_object = ERB.new(@template) # erb object has template as attribute
    erb_object.result(binding) # last evaluated value get returned
  end

  def output(file)
    File.open(file, 'w') do |file|
      file.write(render) # write filter result to the output file
    end
  end
end

ShoppingList.new(shopping_items, template).output('shoppinglistA.html')
