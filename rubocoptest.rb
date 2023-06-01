y = String.new("i thought he said this wasn't going to be abstract...")
puts y

"hi".methods()
puts "hello".upcase()
puts "sUp DuDe".swapcase()
p "This is a sentence, kinda".split()

z = String.new("road trip")
puts z
# puts z.methods()

a = Array.new()
p a

h = Hash.new()
p h

new_arr = Array.new()
new_arr.push("fun")
new_arr.push("games")
p new_arr

a_string = String.new("ear")
puts a_string.class()

class Animal
end 

fido = Animal.new()
puts fido

class Dog
  def speak()
    return("ruff ruff")
  end
end 

spot = Dog.new()
puts spot.speak()

class Penguin
  def looks()
    "We care cute!"
  end 
end 

class Fish
  def self.general_overview()
    return("Fish are animals that live in the sea")
  end
end

puts Fish.general_overview()

class Calculator
  def self.add(a,b)
    a + b 
  end
end

puts Calculator.add(5,6)

class Person
  def initialize(name)
    @name = name 
  end
end

my_person_object = Person.new("Fred")
p my_person_object

class Lion
  def initialize(name)
    @name = name
  end 

  def name
    return(@name)
  end
end

simba = Lion.new("Simba")
puts simba.name()

class Celsius
  def initialize(temperature)
    @temperature = temperature
  end
  def to_f()
    @temperature*1.8 +32
  end
  
end

celsius = Celsius.new(10)
puts celsius.to_f

class Dog 
  def initialize(name)
    @name = name
  end

  def bark()
    "Ruff ruff"
  end
  
end

freedom = Dog.new("Freedom")
p freedom
puts freedom.bark()

class Insect
  def initialize(age_in_days)
    @age_in_days = age_in_days
  end

  def age_in_years()
    @age_in_days.to_f/365
  end
end

bee = Insect.new(30)
puts bee.age_in_years()

class Lamp
  def self.about_me()
    "We brighten up people's lives."
  end
end 

puts Lamp.about_me()

class WaterBottle
  def initialize(size)
    @size = size
  end
  def size()
    @size
  end
end

dasani = WaterBottle.new(20)
puts dasani.size()

class Person
  def initialize(age)
    @age = age
  end

  def age_update=(age)
    @age=age
  end
  def get_age()
    @age
  end
end

poopsy = Person.new(42)
p poopsy 
poopsy.age_update=(44)
p poopsy
puts poopsy.get_age()

module Clueless
  def funny()
    return("AS IF?!")
  end
end

class Actress
  include Clueless
end
alicia = Actress.new
puts alicia.funny()

module HappyHappy
  def say_something()
    return("Happy happy, joy joy")
  end
end

class Human
  include HappyHappy
end

class Alien
  include HappyHappy
end

ren = Human.new
puts ren.say_something()

stimpy = Alien.new
puts stimpy.say_something()

module MathHelper
  def multiply_by_two(n)
    n*2
  end
end

class Homework
  include MathHelper
end

seven = Homework.new
puts seven.multiply_by_two(7)

class Mammal
  def heartbeat?
    true
  end
end

class Pooch < Mammal
end

fido = Pooch.new
puts fido.heartbeat?
# puts fido.methods()

puts Array.ancestors()

class BaseballPlayer
  def initialize(hits, walks, at_bats)
    @hits = hits
    @walks = walks
    @at_bats = at_bats
  end

  def batting_average()
    (@hits/@at_bats.to_f)
  end

  def on_base()
    (@hits+@walks)/@at_bats.to_f
  end

end

player1 = BaseballPlayer.new(66,5,88)
puts player1.batting_average()
puts player1.on_base()    

class Person2
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def first_name()
    @first_name
  end

  def last_name()
    @last_name
  end

  def full_name()
    @first_name +' '+ @last_name
  end

end

human1 = Person2.new("Yo","Mama")
  
puts human1.first_name()
puts human1.last_name()
puts human1.full_name()

module MathHelpers
  def exponent(a,b)
    a**b
  end
end

class Calculator
  include MathHelpers
  
  def square_root(a)
    exponent(a,0.5)
  end
end

c=Calculator.new
puts c.square_root(4)
puts c.square_root(5)
puts c.exponent(4,6)