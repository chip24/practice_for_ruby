case [1,2,3]
in [Integer, Integer]
    puts "matched"
else
    puts "not matched"
end

case {a: 1, b: 2, c: 3}
in {a: Integer}
    puts "matched"
else
    puts "not matched"
end

case {a:1, b:2}
in {a: Integer, **nil}
    puts "matched a part"
in {a: Integer, b: Integer, **nil}
    puts "matched a whole"
else
    puts "not matched"
end

case [1,2,3]
in [Integer,*]
    puts "matched"
else
    puts "not matched"
end

case {a:1,b:2,c:3}
in {a: Integer, **}
    puts "matched"
else
    puts "not matched"
end

case [1,2]
in Integer => a, Integer
    puts "matched: #{a}"
else
    puts "not matched"
end

case {a: 1, b: 2, c: 3}
in a: Integer => m 
    puts "matched: #{m}"
else
    puts "not matched"
end

case [1,2]
in a, Integer
    puts "matched: #{a}"
else
    puts "not matched"
end

case {a: 1, b: 2, c: 3}
in a: m
    puts "matched: #{m}"
else
    puts "not matched"
end

case {a: 1, b: 2, c: 3}
in a:
    puts "matched: #{a}"
else
    puts "not matched"
end

case {name: 'John', friends: [{name: 'Jane'}, {name: 'Rajesh'}]}

in name:, friends: [{name: first_friend}, *]
    puts "matched: #{first_friend}"
else
    puts "not matched"
end

case [1,2,3]
in a, *rest
    puts "matched: #{a}, #{rest}"
else
    puts "not matched"
end

case {a: 1, b: 2, c: 3}
in a:, **rest
    puts "matched: #{a}, #{rest}"
else
    puts "not_matched"
end

expectation = 18

case [1,2]
in expectation, *rest
    puts "matched. expectation was: #{expectation}"
else
    puts "not matched. expectation was: #{expectation}"
end

expectation = 18
case [1,2]
    in ^expectation, *rest
        puts "matched. expectation was: #{expectation}"
    else
        puts "not matched. expectation was: #{expectation}"
    end

jane = {school: 'high', schools: [{id: 1, level: 'middle'}, {id: 2, level: 'high'}]}
john = {school: 'high', schools: [{id: 1, level: 'middle'}]}

case jane
in school:, schools: [*, {id:, level: ^school}]
    puts "matched. school: #{id}"
else
    puts "not matched"
end

case john
in school:, schools: [*, {id:, level: ^school}]
    puts "matched. school: #{id}"
else
    puts "not matched"
end

class Point
    def initialize(x, y)
        @x, @y = x, y
    end

    def deconstruct
        puts "deconstrust called"
        [@x, @y]
    end

    def deconstruct_keys(keys)
        puts "deconstructed_keys called with #{keys}"
        {x: @x, y: @y}
    end
end

case Point.new(1,-2)
in px, Integer
    puts "matched: #{px}"
else
    puts "not matched"
end

case Point.new(1, -2)
in x: 0.. => px
    puts "matched: #{px}"
else
    puts "not matched"
end

class SuperPoint < Point
end

case Point.new(1,-2)
in SuperPoint(x: 0.. => px)
    puts "matched: #{px}"
else
    puts "not matched"
end

case SuperPoint.new(1,-2)
in SuperPoint[x:0.. => px]
    puts "matched: #{px}"
else
    puts "not matched"
end

case [1,2]
in a, b if b == a*2
    puts "matched"
else
    puts "not matched"
end

case [1,1]
in a,b if b==a*2
    puts "matched"
else
    puts "not matched"
end

case [1,2]
in a, b unless b== a*2
    puts "matched #{a} and #{b}"
else
    puts "not matched #{a} and #{b}"
end

case {a: 1, b: 2}
in {a: Integer}
    puts "matches" # By default, all object matches are partial
in {a: Integer, **}
    puts "matches" # and is same as {a: Integer}
in {a: a}
    puts "matches" # and the value of variable a is now 1
in {a: Integer => a}
    puts "matches" # and the value of variable a is now 1
in {a: 1, b: b}
    puts "matches" # and the value of variable b is now 2
in {a: Integer, **nil}
    puts "does not match" # This will match only if the object has a and no other keys
end

def greet(hash = {})
    case hash
    in {greeting: greeting, first_name: first_name, last_name: last_name}
      greet(greeting: greeting, name: "#{first_name} #{last_name}")
    in {greeting: greeting, name: name}
      puts "#{greeting}, #{name}"
    in {name: name}
      greet(greeting: "Hello", name: name)
    in {greeting: greeting}
      greet(greeting: greeting, name: "Anonymous")
    else
      greet(greeting: "Hello", name: "Anonymous")
    end
  end
  
  greet # Hello, Anonymous
  greet(name: "John") # Hello, John
  greet(first_name: "John", last_name: "Doe") # Hello, John Doe
  greet(greeting: "Bonjour", first_name: "John", last_name: "Doe") # Bonjour, John Doe
  greet(greeting: "Bonjour") # Bonjour, Anonymous

a = 1

case {a:1, b: 2}
in {a: ^a}
    puts "matched"
else
    puts "not matched"
end  
city = "Amsterdam"

order = {billing_address: {city: "Berlin"}, shipping_address: {city: "Zurich"}}
case order
in {billing_address: {city:}, shipping_address: {city: ^city}}
    puts "both billing and shipping are to the same city"
else
    puts "both billing and shipping must be to the same city"
end

puts city

class User
    def deconstruct_keys(keys)
        {first_name: first_name, last_name: last_name}
    end
end

case user
in {first_name: "John"}
    puts "Hey, John"
end

class Location
    def deconstruct
        [latitude, longitude]
    end
end

case location 
in [Float => latitude, Float => longitude]
    puts "#{latitude}, #{longitude}"
end







