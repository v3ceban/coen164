# frozen_string_literal: true

# student
class Student
  include Comparable # mixin that defines <, ==, >, <=, >= methods
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def <=>(other)
    name <=> other.name
  end

  # will automatically call self.to_s in the comparison and sort
  def to_s
    name
  end
end

s1 = Student.new('John')
s2 = Student.new('Jane')
s3 = Student.new('Jim')

puts [s1, s2, s3].sort
puts s1 < s2
puts s3 > s2
