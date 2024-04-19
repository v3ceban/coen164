# frozen_string_literal: true

print "Step 1\n"
# Step 1
class Greeting
  def basic_greet
    'nice to meet you'
  end
end

# Hello subclass that greets the name
class Hello < Greeting
  def hello(name)
    "hello, #{name}, #{basic_greet}"
  end
end

obj = Hello.new

puts obj.hello('john')
puts obj.hello('amy')

print "\nStep 2\n"
# Step 2
module GreetingMod
  def basic_greet
    'nice to meet you'
  end

  # Hello class that greets the name using the module
  class Hello
    include GreetingMod

    def hello(name)
      "hello, #{name}, #{basic_greet}"
    end
  end
end

obj = GreetingMod::Hello.new
puts obj.hello('john')
puts obj.hello('amy')

print "\nStep 3\n"
# Step 3
module Gym
  # Gym push
  class Push
    def up
      40
    end
  end
end

module Dojo
  # Dojo push
  class Push
    def up
      30
    end
  end
end

gym_push = Gym::Push.new
dojo_push = Dojo::Push.new

p gym_push.up
p dojo_push.up

print "\nStep 4\n"
# Step 4
module Dojo
  A = 4
  module Kata
    B = 8
    module Roulette
      # Class that returns push
      class ScopeIn
        def push
          15
        end
      end
    end
  end
end

A = 16
B = 23
C = 42

puts "Dojo A: #{Dojo::A}, Dojo B: #{Dojo::Kata::B}"
puts "A: #{A}, B: #{B}, C: #{C}"

obj = Dojo::Kata::Roulette::ScopeIn.new
puts "Push: #{obj.push}"

print "\nStep 5\n"
# Step 5
module Greetings
  def english
    puts 'hello'
  end

  def french
    puts 'bonjour'
  end

  def spanish
    puts 'hola'
  end

  # Says hello in the language of the module
  class Hello
    include Greetings # Part a, allows Hello objects to use the module
    extend Greetings # Part b, allows Hello to use the module directly
  end
end

hello = Greetings::Hello.new
hello.english
hello.french
hello.spanish

Greetings::Hello.english
Greetings::Hello.french
Greetings::Hello.spanish

print "\nStep 6\n"
# Step 6
puts 'See the code on line 131 for examples'
/hello/ =~ '..hello...'
/love | hate/ =~ 'I love you'
/colou?r/ =~ '.color...'
/gr[ae]y/ =~ '...gray...'
/b[aeiou]bble/ =~ '..bobble...'
/go*gle/ =~ '.goooooogle...'
/go+gle/ =~ '....gogle...'
/(g(oo)+gle)/ =~ 'goooogle...'
/x{3}/ =~ '.xxx..'
/x{6,10}/ =~ '..xxxxxxx..'
/w/ =~ 'some word'
/\w/ =~ 'some word'
/d/ =~ 'some word'
/\d/ =~ '123'
/\d{5}/ =~ 'abc12345xyz'
/\d+(\.\d\d)?/ =~ '....123.45.....'
/hello\d+/ =~ 'hello123'
/sh[^io]t/ =~ 'shat'
/^ruby/ =~ 'ruby..'
/ruby$/ =~ '..ruby'
/^ruby$/ =~ 'ruby'

print "\nStep 7\n"
# Step 7
string = 'abc12def34ghi56jkl78mn98op76qrs'
puts string
puts string.gsub(/\d/, '-')
puts string.gsub(/\d+/, '-')
string.scan(/\d+/) { |num| print num }
print "\n"
puts string.scan(/\d/).first
puts string.gsub(/\D/, '-')
puts string.scan(/\d{2}/).join('-')
