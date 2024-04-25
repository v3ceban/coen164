# frozen_string_literal: true

require 'erb'

template = ERB.new(%(The value of x is: <%= val %>))

def mymethod(val, temp)
  puts temp.result(binding)
end

mymethod(20, template)

# template2 = ERB.new(%(The value of x is: <%= x %>)) # throws an error with wrong binding
# mymethod(21, template2)

# template3 = ERB.new(%(The value of x)) # doesn't throw an error, but doesn't print the value
# mymethod(22, template3)

# template4 = ERB.new(%(The value of x is: <%= val %>))
# mymethod(template4) # throws an error due to wrong number of arguments
