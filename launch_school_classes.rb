class MyCar 

    attr_accessor :year, :color, :model, :speed

    def initialize(year, color, model, speed = 0)
        @year = year
        @color = color 
        @model = model 
        @speed = speed 

    end

    def speed_up(number)
        @speed += number 
        "You push the gas and accelerate #{number} mph to reach #{speed}."
    end

    def brake(number)
        @speed -= number
        "You push the brake and decelerate  #{number} mph to reach #{speed}."
    end

    def turn_off
        @speed = 0
        "You've turned off the car and the speed is now #{@speed} mph."
    end


    def to_s 
        "My #{year} #{model} is #{color} and driving at #{speed} mph."
    end

    def spray_paint(color)
        self.color = color
        puts "Your new #{color} car looks great."
    end

    def car_year
        "Your car was made in #{@year}."
    end

    def self.gas_mileage(gallons, miles)
        puts "#{miles/gallons} miles per gallon of gas."
    end
end

jetta = MyCar.new(2012, "black", "Jetta")
#puts jetta.to_s
# don't need to add "to_s" b/c puts automatically calls it
puts jetta 
puts jetta.speed_up(5)
puts jetta.brake(2)
puts jetta.turn_off
jetta.spray_paint("blue")
# don't need to add "to_s" b/c puts automatically calls it
puts jetta
puts jetta.car_year
MyCar.gas_mileage(13, 351)


class GoodDog
    DOG_YEARS = 7

    attr_accessor :name, :age

    def initialize(n, a)
        self.name = n
        self.age = a * DOG_YEARS 
    end

    def to_s
        "This dog's name is #{name} and it is #{age} in dog years."
    end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.age

puts sparky
#puts "#{sparky}"

class Foo
    def to_s
        "42"
    end
end

foo = Foo.new
puts foo
puts "foo is #{foo}"

class Bar 
    attr_reader :xyz

    def initialize
        @xyz = {a: 1, b: 2}
    end

    def to_s
        "I am a Bar object!!"
    end
end

bar = Bar.new
puts bar
puts bar.xyz

class GoodDogTwo
    attr_accessor :name, :height, :weight

    def initialize(n, h, w)
        self.name = n 
        self.height = h 
        self.weight = w
    end

    def change_info(n, h, w)
        self.name = n 
        self.height = h 
        self.weight = w 
    end

    def info 
        "#{self.name} weights #{self.weight} pounds and is #{self.height} inches tall."
    end

    def what_is_self
        self
    end

    puts self
end

sparky = GoodDogTwo.new("Sparky", "12", "10")
p sparky.what_is_self

class MyAwesomeClass
    def self.this_is_a_class_method
    end
end

class Person
    attr_accessor :name

    def initialize(name)
        @name = name 
    end
end

bob = Person.new("Steve")
bob.name = "Bob"
puts bob.name

        