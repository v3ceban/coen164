#!/usr/bin/ruby
# frozen_string_literal: false

# Integers

# puts(5.class)

# 5.times = for(i = 0; i < 5; i++)

# 5.times { puts 'hello world' }
#
# 5.times do
#   puts 'hello world'
# end
#
# # loop variable is defined in ||
# 5.times do |i|
#   print i # print doesn't add new line
# end
#
# 3.times do
#   print '*'
# end

# def pattern(number)
#   number.times do |i|
#     (i + 1).times { print '*' }
#     puts
#   end
# end
#
# pattern(10)

# another way to do this
# 5.times do |i|
#   puts '*' * (i + 1)
# end

# 5.upto(10) do |i|
#   print "#{i} "
# end
# puts
#
# 10.downto(5) do |i|
#   print "#{i} "
# end
# puts

# range
# (3...5).begin # 3
# (3...5).end # 5
# (3...5).cover?(5) # false
# (3..5).cover?(5) # true
#
# range = ('aa'..'bb')
# puts range.last(5)
# puts range.count
#
# a = 5
# puts 'i have #{a} dogs'
# puts "i have #{a} dogs"
# puts "i have #{a + 5} dogs"
#
# 'kekes'.each_char do |char|
#   puts char
# end

# array = [1, 2, 3, 'kekes', (3..5), [4, 5, 6]]
# puts array.class
# puts array[3].class
# puts array[3][0]
# puts array[4].class
#
# a = [1, 2, 3]
# b = [3, 4, 5]
# print a | b
# puts
# print a & b
# puts
# print a + b
# puts
# print a - b
# puts
#
# c = a + b
# c.uniq # dont't change c
# c.uniq! # change c
# print c
# puts
#
# d = []
# puts d.empty?
# d.push 1
# d.push 'love'
# puts d
# d.shift # queue
# puts d
#
# e = [1, 2, 3, 4, 5, 6, 7, 8]
# f = []
# e.select do |i|
#   i.even? && f.push(i)
# end
# print f
# puts
#
# e.map! do |i|
#   i**2
# end
# print e
# puts
#
# g = [1, 2, 3, 4]
# sum = 0
# g.inject do |current, i|
#   sum = current + i
# end
# puts sum
#
# h = { fname: 'yuan', lname: 'wang' }
# puts h.class
# puts "#{h[:fname]} #{h[:lname]}"

# def mymethod
#   puts '*'
# end
#
# puts :mymethod
#
# method(:mymethod).call
#
# name = :mymethod
# puts name
# method(name).call

h1 = { a: 1, b: 2, c: 3 }
print h1.keys
puts
print h1.values
puts

h1.each_key do |x|
  print x
end
puts

h1.each_value do |x|
  print x
end
puts

h1.each do |key, value|
  print "#{key}: #{value} "
end
puts
