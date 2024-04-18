# frozen_string_literal: true

# modules

module Wheather
  TEMPERATURE_SCALE = 'Celsius'
  AVERAGE_TEMP = 22
end

# puts "the temperature scale is:  #{Wheather::TEMPERATURE_SCALE}"
# puts "the average temperature is:  #{Wheather::AVERAGE_TEMP} degrees"

module Astronomy
  EARTH_RADIUS_KM = 6000

  # planets
  class Planet
    attr_reader :name, :radius # only need to read values, no need to modify them

    def initialize(name, radius)
      @name = name
      @radius = radius
    end

    def describe
      "Planet #{name} has a radius of #{radius}km"
    end
  end

  # stars
  class Star
    attr_reader :name, :type

    def initialize(name, type)
      @name = name
      @type = type
    end

    def describe
      "Star #{name} is a #{type} star"
    end
  end
end

earth = Astronomy::Planet.new('Earth', Astronomy::EARTH_RADIUS_KM)
sun = Astronomy::Star.new('Sun', 'G_type')

puts earth.describe
puts sun.describe
