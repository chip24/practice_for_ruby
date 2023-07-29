class LinkedList
    def initialize
        @head = nil
    end

    def append(value)
        if @head
            find_tail.next = Node.new(value)
        else
            @head = Node.new(value)
        end
    end
    def find_tail
        node = @head

        return node if !node.next
        return node if !node.next while (node = node.next)
    end

    def append_after(target, value)
        node = find(target)
        return unless node
        old_next = node.next
        node.next = Node.new(value)
        node.next.next = old_next
    end

    def find(value)
        node = @head

        return false if !node.next
        return node if node.value == value

        while (node = node.next)
            return node if node.value == value
        end
    end

    def delete(value)
        if @head.value == value
            @head = @head.next
            return 
        end
        node = find_before(value)
        node.next = node.next.next
    end

    def find_before(value)
        node = @head

        return false if !node.next
        return node if node.next.value == value

        while (node = node.next)
            return node if node.next && node.next.value == value
        end
    end

    def print
        node = @head
        puts node

        while (node = node.next)
            puts node
        end
    end
end


class Node
   attr_accessor :next
   attr_reader :value

   def initialize(value)
    @value = value
    @next = nil
   end

   def to_s
    "Node with value: #{@value}"
   end
end

list = LinkedList.new

list.append(10)
list.append(20)
list.append(30)

#list.print

list.append_after(10, 15)
list.append_after(20, 25)

#list.print

class Vehicle

    #attr_reader :number_of_wheels
    #attr_writer :number_of_wheels
    attr_accessor :number_of_wheels

    def initialize(number_of_wheels, type_of_tank, seating_capacity, maximum_velocity)
        @number_of_wheels = number_of_wheels
        @type_of_tank = type_of_tank
        @seating_capacity = seating_capacity
        @maximum_velocity = maximum_velocity
    end

    def make_noise
        "VRRRRUUUUM"
    end

    #def number_of_wheels
    #    @number_of_wheels
    #end

    #def set_number_of_wheels = (number)
     #   @number_of_wheels = number
    #end

end

tesla_model_s = Vehicle.new(4, 'electric', 5, 250)

p tesla_model_s.number_of_wheels

tesla_model_s.number_of_wheels = 3

#p tesla_model_s

v = Vehicle.new(4, 'gasoline', 5, 180)

p v.make_noise

class Person
    
    attr_accessor :name
    attr_accessor :age
    
    def initialize(name, age)
        @name = name
        @age = age 
    end

    #def name
    #    @name
    #end

    #def age 
    #    @age
    #end

end

tk = Person.new("Leandro Tk", 24)

#p tk.name
#p tk.age

class Car
    attr_accessor :number_of_wheels, :seating_capacity, :maximum_velocity

    def initialize(number_of_wheels, seating_capacity, maximum_velocity)
        @number_of_wheels = number_of_wheels
        @seating_capacity = seating_capacity
        @maximum_velocity = maximum_velocity
    end
end

my_car = Car.new(4, 5, 250)
#p my_car.number_of_wheels
#p my_car.seating_capacity
#p my_car.maximum_velocity

class ElectricCar < Car
end

tesla_model_three = ElectricCar.new(4,5,250)
#p tesla_model_three.number_of_wheels
#p tesla_model_three.seating_capacity
#p tesla_model_three.maximum_velocity

module Skill
    def average_speed
        puts "My average speed is 20mph"
    end
end

class RunnerAthlete
    
    include Skill

    attr_accessor :name

    def initialize(name)
        @name = name 
    end
end



mohamed = RunnerAthlete.new("Mohamed Farah")
mohamed.average_speed
#p mohamed.name

class User
    def initialize(name)
        @name = name 
    end

    def name 
        @name
    end

    def self.all 
        [new("Thijs"), new("Robert"), new("Tom")]
    end
end

#user = User.new("Thijs")
#p user.name

thijs, robert, tom = User.all

#puts thijs.class
#puts robert.class 
#puts tom.class 
    
#puts thijs.singleton_class
#puts robert.singleton_class
#puts tom.singleton_class

robert = User.new("Robert")

def robert.last_name
    "Beekman"
end

#puts robert.last_name

tom = User.new("Tom")

def tom.last_name
    "de Bruijn"
end

class GoodDog
    
    attr_accessor :name, :height, :weight

    @@number_of_dogs = 0
    
    def initialize(n, h, w)
        @name = n
        @height = h 
        @weight = w 
        @@number_of_dogs += 1

    end

    def change_info(n, h, w)
        # taking out the @ sign before name, height, and weight will call the setter method instead of accessing the variables directly, but we have to add "self." before each one to tell Ruby we're not creating new local variables but calling a method (the setter method). We could also use "self." with getter methods, but it's not required
        self.name = n 
        self.height = h 
        self.weight = w
    end

    def info
        "#{name} weighs #{weight} and is #{height} tall."
    end

    # getter method
    #def name
     #   @name
    #end

    # setter method
    #def name=(n)
    #    @name = n
    #end

    def speak
        # when there is no @ before 'name' we're calling the instance method (getter) rather than the instance variable.  Either 'name' or '@name' will work though.
        "#{name} says arf!"
    end

    def self.what_am_i
        "I'm a GoodDog class!"
    end


    def self.total_number_of_dogs
        @@number_of_dogs
    end
end

sparky = GoodDog.new("Sparky", "12 inches", "10 lbs")
puts sparky.speak
puts sparky.name
#sparky.name = "Spartacus"
#puts sparky.name
#fido = GoodDog.new("Fido")
#puts fido.speak
puts sparky.info
sparky.change_info("Spartacus", "24 inches", "45 pounds")
puts sparky.info
puts GoodDog.what_am_i
puts GoodDog.total_number_of_dogs

dog1 = GoodDog.new("Patoot", "400", "5000")
puts GoodDog.total_number_of_dogs



