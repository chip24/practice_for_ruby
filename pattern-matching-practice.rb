grade = "C"

case grade
when "A" then puts "Amazing effort"
when "B" then puts "Good work"
when "C" then puts "Well done"
when "D" then puts "Room for improvement"
else puts "See me"
end

case grade
in "A" then puts "Amazing effort"
in "B" then puts "Good work"
in "C" then puts "well done"
in "D" then puts "Room for improvement"
else puts "See me"
end

result = case grade
    in "A" then 1
    in "B" then 2
    in "C" then 3
    else 0
end
puts result

input = 3

case input
in String then puts "input was of type String"
in Integer then puts "input was of type Integer"
end

age = 15

case age
in b 
    puts b
end

a = 5

case 1
in a
   a
end

puts a

case 1
in ^a
    :no_match
end
puts ^a

case 3
in 3 => a
    puts a
end

case 0
in 0|1|2
 puts :match 
end

some_other_value = true

case 0
in 0 if some_other_value
    puts :match
end

arr = [1,2]

case arr
in [1,2] then puts :match
in [3,4] then puts :no_match
end

case arr
in [Integer, Integer]
    puts :match
in [String, String]
    puts :no_match
end

arr = [1,2,3]

case arr
in [Integer, Integer, *]
    puts :match
end

arr = [1,2,3,4,5,6,7,8,9,10]

case arr
in [Integer, Integer, *, 9, 10]
    puts :match
end

arr = [1,2,3,4]

case arr
in [1,2,*tail]
    p tail
end

arr = [1,2,3,4]

case arr
in [_,_,3,4]
    puts :match
end

arr = [1,2]

case arr
in [a,b] unless a == b
    puts :match
end

arr = [1,2,[3,4]]

case arr
in [_,_,[3,4]]
    puts :match
end

arr = [1,2,3,4,5]

case arr
in [1,2,3,a,b]
    puts a
    puts b
end

case [1,2,3,[4,5]]
in [1,2,3,[4,a] => arr]
    puts a
    p arr
end

arr = [1,2,3]

case [1,2,4]
in arr
    :match
end
p arr

arr = [1,2,3,4]

case arr
in 1,2,3,4
 puts :match
end

case {a: 'apple', b: 'banana'}
in {a: 'aardvark', b: 'bat'}
    puts :no_match
in {a: 'apple', b: 'banana'}
    puts :match
end

case {a: 'apple', b: 'banana'}
in {a: a, b: b}
    puts a
    puts b
end

case {a: 'apple', b: 'banana'}
in {a:, b:}
    puts a
    puts b
end

case {a: 'ant', b: 'ball', c: 'cat'}
in {a: 'ant', **rest}
    p rest 
end

case {a:'ant', b: 'ball'}
in {a:'ant'}
    puts 'this will match'
in {a: 'ant', b: 'ball'}
    puts 'this will never be reached'
end

case {a: 'ant', b: 'ball'}
in {a: 'ant'}
    puts :no_match
in {a: 'ant', b: 'ball'}
    puts :match
end

case {a: 'ant', b: 'ball'}
in {a: 'ant'} => hash
    p hash
end

login = {username: 'hornby', password: 'iliketrains'}

login => {username: username}

puts "Logged in with username #{username}"

case [1,2,3]
in [*pre, 1,2,3, *post]
    p pre
    p post 
end

case [1,2,3,4,5]
in [*pre, 2, 3, *post]
    p pre 
    p post 
end

case [1, 2, "a", 4, "b", "c", 7, 8, 9]
in [*pre, String => x, String => z, *post]
    p pre 
    p x
    p z 
    p post 
end

data = [
  {name: 'James', age: 50, first_language: 'english', job_title: 'general manager'},
  {name: 'Jill', age: 32, first_language: 'italian', job_title: 'leet coder'},
  {name: 'Helen', age: 24, first_language: 'dutch', job_title: 'biscuit quality control'},
  {name: 'Bob', age: 64, first_language: 'english', job_title: 'table tennis king'},
  {name: 'Betty', age: 55, first_language: 'spanish', job_title: 'pie maker'},
]

name = "Jill"
age = 32
job_title = 'leet coder'

match = data.find do |person|
    person[:name] == name && person[:age] == age && person[:job_title] == job_title
end

match&.fetch(:first_language)

case data
in [*, {name:^name, age:^age, first_language: first_language, job_title: ^job_title}, *]
else
    first_language = nil
end

puts first_language

config = {db: {user: 'admin', password: 'abc123'}}

case config
in db: {user:}
    puts "Connect with user '#{user}'"
in connection:{username: }
    puts "Connect with user '#{username}'"
else
    puts "Unrecognized structure of config"
end

config => {db: {user:}} 
puts "Connect with user '#{user}'"

users = [{name: "Alice", age: 12}, {name: "Bob", age: 23}]
users.any? {|user| user in {name: /B/, age: 20..}}

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

case {a: 1, b: 2, c: 3}
in {}
    puts "matched"
else
    puts "not matched"
end

case {}
in {}
    puts "matched"
else
    puts "not matched"
end

case {a: 1, b: 2}
in {a: Integer, **nil}
    puts "matched a part"
in {a: Integer, b: Integer, **nil}
    puts "matched a whole"
else
    puts "not matched"
end

case [1,2,3]
in [Integer, *]
    puts "matched"
else
    puts "not matched"
end

case {a: 1, b: 2, c: 3}
in {a: Integer, **}
    puts "matched"
else
    puts "not matched"
end

case ["a", 1, "b", "c", 2]
in [*, String, String, *]
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
in a: m 
    puts "matched: #{m}"
else
    puts "not matched"
end

case {a: 1, b: 2, c: 3}
in a:
    puts"matched: #{a}"
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
    puts "not matched"
end

case {a: 1, b: 2}
in {a: _, b: _foo} | Array
    puts "matched: #{_}, #{_foo}"
else
    puts "not matched"
end



expectation = 18

case [1,2]
in expectation, *rest
    puts "matched. expectation was : #{expectation}"
else
    puts "not matched. expectation was #{expectation}"
end

expectation = 18

case [1,2]
in ^expectation, *rest
    puts "matched. expectation was : #{expectation}"
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
      puts "deconstruct called"
      [@x, @y]
    end
  
    def deconstruct_keys(keys)
      puts "deconstruct_keys called with #{keys.inspect}"
      {x: @x, y: @y}
    end
  end

case Point.new(1,-2)
in px, Integer 
    puts "matched: #{px}"
else
    puts "not matched"
end

case Point.new(1,-2)
in x: 0.. => px
    puts "matched: #{px}"
else
   puts "not matched"
end

case Point.new(1, -2)
in x: 0.. => px, **rest
    "matched: #{px}"
else
    "not matched"
end

case [1,2]
in a, b if b == a*2
    puts "matched"
else
    puts "not matched"
end

case [1,1]
in a, b unless b ==a*2
    puts "matched"
else
    puts "not matched"
end


































