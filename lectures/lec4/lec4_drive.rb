# frozen_string_literal: true

# require './lec4' # looks in defined path
require_relative 'lec4' # looks in current directory

wheel = Wheel.new(2, 24)
puts 'Wheel Details:'
puts "Diameter: #{wheel.diameter}"
puts "Circumference: #{wheel.circumference}"
puts "Rim: #{wheel.rim}"
puts "Tire: #{wheel.tire}"

puts '-' * 50

gear = Gear.new(30, 20, wheel)
puts 'Gear Details:'
puts "Ratio: #{gear.ratio}"
puts "Gear Inches: #{gear.gear_inches}"
