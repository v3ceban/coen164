# frozen_string_literal: true

h = { a: 1, b: 2, c: 3 }
puts h.key?(:a)

def search(options)
  options = { duration: 100 }.merge(options)
  if options.key?(:genre)
    # genre = options[:genre] # save option to do something with it
    options.delete(:genre)
  end

  if options.key?(:duration)
    # duration = options[:duration] # save option to do something with it
    options.delete(:duration)
  end

  print "Invalid options: #{options.keys.join(', ')}\n" unless options.empty?
end

search({ genre: 'jazz', duration: 120 })
search({ genre: 'jazz', duration: 120, year: 2019 })
search({ genre: 'jazz', duration: 120, kek: 'w', lol: 'k' })
search(genre: 'jazz', duration: 120) # named arguments

age = 100
puts 'you are old' if age > 90
puts 'you are young' unless age > 90

# assignment statement
a = 5 # has return value of 5
puts "a = #{a}"
b = a = 5 # is the same as b = 5
puts "a = #{a}, b = #{b}"
a = 1, 2, 3, 4 # returns [1, 2, 3, 4]
puts "a = #{a}"
a, b = 1, 2, 3, 4 # a gets 1, b gets 2, 3 and 4 are discarded
puts "a = #{a}, b = #{b}"
c = (a, b = 1, 2, 3, 4) # c becomes [1, 2, 3, 4], a 1, b 2
puts "c = #{c}, a = #{a}, b = #{b}"

# fibonnaci sequence
n1 = n2 = 1
max = 100
while n1 < max
  print "#{n1} "
  n1, n2 = n2, n1 + n2
end
puts

# splat
a, b, c = (1..3)
print a, b, c # only a getss a value
puts

a, b, c = *(1..3)
print a, b, c # all variables get a value, can also work on arrays
puts

a = [1, 2]
b = [3, 4]
print a, b
puts

a, *b = [1, 2], [3, 4]
print a, b
puts

# ruby returns last value by default
def return_b
  a = 5
  b = 10
end

print return_b
puts

def return_splat(aaa, *bbb, ccc)
  p [aaa, bbb, ccc]
end

return_splat(1, 2, 3, 4, 5, 6)

# keyword parameters
def m(ccc:, bbb:, aaa: 20)
  # a has default value of 20
  p [aaa, bbb, ccc]
end

m(bbb: 5, ccc: 10)

# calling blocks in method/function
def repeatonce
  yield
  yield
end

puts 'repeatonce'
repeatonce { puts 'hello' }

def repeat(number, &block)
  number.times(&block)
end

puts 'repeat(n)'
repeat(3) { puts 'hello' }

def repeat2(number)
  number.times { yield('hello') }
end

puts 'repeat2(n)'
repeat2(3) do |x|
  puts x
end

x = 5
loop do
  break if x.negative?

  puts x
  x -= 1
end

# classes
# classes have attributes and functions. attributes are defined inside functions
# has to start with a capital letter
# class MyClass
#   def initialize
#     @x = 1
#   end
#
#   def function1
#     @x = 4
#   end
#
#   def function2
#     @y = 5
#   end
# end

# Box class
class MyBox
  attr_accessor :width, :height, :length # getter and setter

  def initialize(width = 1, height = 1, length = 1)
    # instance variables, default valuses set to 1
    @width = width
    @height = height
    @length = length
  end

  # instance methods
  def volume
    @width * @height * @length
  end

  def change_dimensions(width = @width, height = @height, length = @length)
    # default values set to be the same as current values. changes the instance variables if values are provided
    @width = width
    @height = height
    @length = length
  end
end

box1 = MyBox.new(1, 2, 3)
# box2 = MyBox.new(2, 3, 4)
# box2.change_dimensions
# puts box1.volume
# puts box2.volume
# box1.change_dimensions(1, 3, 4)
# puts box1.volume
# box2.width = 5 # not possible if a method is not created (getter and/or setter on line 144)
# puts box2.width
# puts box2.volume
box1.width = 2
box1.height = 2
puts box1.width
puts box1.height
puts box1.length
puts box1.volume
