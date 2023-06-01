[1,2,3].each do |n|
    puts "Number #{n}"
end

[1,2,3].each {|n| puts "Number #{n}"}

def my_method
    puts "something"
end

my_method {"hello"}

def my_method
    puts "reached the top"
    yield
    puts "reached the bottom"
end

my_method do
    puts "reached yield"
end

def my_method
    yield("John", 2)
    #puts "Hi, #{name}"
end

my_method {|name, age| puts "#{name} is #{age} years old"}

def my_method
    value = yield
    puts "value is: #{value}"
end

my_method do
    2
end

def a_method(&block)
    block 
end

puts a_method{ "x" }

a_proc = Proc.new {"x"}
puts a_method(&a_proc)

a_lambda = -> () {"x"}
puts a_method(&a_lambda)

puts a_method(&:even?)

#a_proc = :foobar.to_proc
#a_proc.call("some string")

def my_map(array)
    new_array = []
    for element in array 
        new_array.push yield element
    end

    p new_array
end

my_map([1,2,3]) do |number|
    number * 2
end

class Car
    attr_accessor :color, :doors

    def initialize
        yield(self)
    end
end

car = Car.new do |c|
    c.color = "Red"
    c.doors = 4
end


puts "My car's color is #{car.color} and it's got #{car.doors} doors."

class Fixnum 
    def to_proc
        Proc.new do |obj, *args|
            obj % self == 0
        end
    end
end

numbers = [1,2,3,4,5,6,7,8,9,10].select(&3)
puts numbers
