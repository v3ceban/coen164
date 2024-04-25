# frozen_string_literal: true

require 'erb'

template = ERB.new(%(The value of x is: <%= val %>))

def mymethod(val, temp)
  puts temp.result(binding)
end

mymethod(20, template)

# template2 = ERB.new(%(The value of x is: <%= x %>)) # throws an error without binding
template2 = ERB.new(%(The value of x is: <%= val %>)) # throws an error without binding
mymethod(21, template2)
