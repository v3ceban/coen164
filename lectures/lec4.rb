# frozen_string_literal: true

# lec4.rb class
class MyClass
  attr_accessor :attr1, :attr2, :attr3

  # puts 'I'
  # instance method
  def initialize
    @attr1 = 0 # instance variable
  end

  # puts 'love'
  def m1
    @attr2 = 1
  end

  # puts 'you'
  def m2
    @attr3 = 2
  end
end

# obj = MyClass.new
# puts "#{obj.attr1} #{obj.attr2} #{obj.attr3}"
# obj.m1
# puts "#{obj.attr1} #{obj.attr2} #{obj.attr3}"
# obj.m2
# puts "#{obj.attr1} #{obj.attr2} #{obj.attr3}"
#
# puts '-' * 50

# Student with name, age, id, address, year, and gpa
class Student
  attr_accessor :name, :age, :id, :addr, :year, :gpa
end

student = Student.new
student.name = 'John'
student.age = 20
student.id = 123
student.addr = '123 Main St'
student.year = 2020
student.gpa = 3.5
# puts "Name: #{student.name},
# Age: #{student.age},
# ID: #{student.id},
# Address: #{student.addr},
# Year: #{student.year},
# GPA: #{student.gpa}"
#
# puts '-' * 50

# bike wheel
class Wheel
  attr_accessor :tire, :rim

  def initialize(tire, rim)
    @tire = tire
    @rim = rim
  end

  def diameter
    rim + 2 * tire
  end

  def circumference
    diameter * Math::PI
  end
end

# bike gear
class Gear
  attr_accessor :fgear, :bgear, :wheel

  def initialize(fgear, bgear, wheel)
    @fgear = fgear
    @bgear = bgear
    @wheel = wheel
  end

  def ratio
    fgear.to_f / bgear
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

# operator method
# 3 * 4 // * is an operator, however, since it's an operator method it doesn't need a . in front (i.e. 3.*4)
puts 3 * 4
puts 3.* 4

# you can redefined default classes
# class Integer
#   alias original_times *
#
#   def *(other)
#     original_times(other) + 1
#   end
# end
#
# puts 1 * 1

# returns the average
class MyNewClass
  def initialize
    @sum = @count = 0
  end

  def <<(value)
    @sum += value
    @count += 1
    self # has to return the same object here to enable chain calling
  end

  def average
    @sum / @count.to_f
  end
end

obj = MyNewClass.new
puts (obj << 34 << 45 << 39 << 31).average # chain call with << as operator method (obj.<<(34) === obj << 34)

# redefining times
class Integer
  def times
    n = 0
    while n < self
      yield(n)
      n += 1
    end
  end
end

5.times { |i| puts i }
