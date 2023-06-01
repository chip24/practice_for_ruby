[1,2,3].each {|num| puts num}

[1,2,3].each do |num|
    puts num 
end

def logger
    yield 
end

logger {puts 'hello from the block'}

logger do 
    p [1,2,3]
end

def double_vision
    yield
    yield
end

double_vision { puts "How many fingers am I holding up?"}

def love_language
    yield("Ruby")
    yield ("Rails")
end

love_language {|lang| puts "I love #{lang}"}

@transactions = [10, -15, 25, 30, -24, -70, 999]

def transaction_statement
    @transactions.each do |transaction|
        yield transaction
    end
end

transaction_statement do |transaction|
    p "%0.2f" % transaction
end

@transactions = [10, -15, 25, 30, -24, -70, 999]

def transaction_statement
    @transactions.each do |transaction|
        p yield transaction
    end
end

transaction_statement do |transaction|
    "%0.2f" % transaction
end

@transactions = [10, -15, 25, 30, -24, -70, 999]

def transaction_statement
    formatted_transactions =[]
    @transactions.each do |transaction|
        formatted_transactions << yield(transaction)
    end

    p formatted_transactions
end

transaction_statement do |transaction|
    "%0.2f" % transaction
end

def say_something
    yield
end

say_something do |word|
    puts "And then I said: #{word}"
end

def mad_libs
    yield('cool', 'beans', 'burrito')
end

mad_libs do |adjective, noun|
    puts "I said #{adjective} #{noun}"
end

def awesome_method
    hash = {a: 'appple', b: 'banana', c: 'cookie'}

    hash.each do |key, value|
        yield key, value
    end
end

def simple_method
    yield
end

def maybe_block
    if block_given?
        puts "block party"
    end
    puts "executed regardless"
end

maybe_block

maybe_block {}

my_lambda = lambda { puts "my lambda"}

my_other_lambda = -> {puts "hello from the other side"}

my_lambda.call
my_other_lambda.call

my_name = -> (name) {puts "hello #{name}"}

my_age = lambda {|age| puts "I am #{age} years old"}

my_name.call("tim")
my_name.("Tim")
my_name["tIm"]
my_name. === "tiM"
my_age.call(78)

a_proc = Proc.new {puts "this is a proc"}

a_proc.call

a_proc = proc {puts "this is a proc"}

a_proc.call

a_proc = Proc.new {|name, age| puts "name: #{name} --- age: #{age}"}

a_proc.call("TIM", 80)

a_proc = Proc.new {|a, b| puts "a: #{a} --- b: #{b}"}

a_proc.call("apple")

nested_array = [[1,2], [3,4], [5,6]]
puts nested_array.select {|a,b| a + b >10 }

a_lambda = lambda { |a, b| puts "a: #{a} --- b: #{b}"}

a_lambda.call("apple", "banana")

a_lambda = -> {return 1 }
a_lambda.call

def my_method
    a_proc = Proc.new {return}
    puts "this line will be printed"
    a_proc.call
    puts "this line is never reached"
end
my_method

my_proc = Proc.new { |name= "bob"| puts name}

my_proc.call

my_lambda = ->(name="r2d2") {puts name}

my_lambda.call

def my_method(useful_arg)
    useful_arg.call
end

my_lambda = -> {puts "lambda"}
my_proc = Proc.new {puts "proc"}

my_method(my_lambda)

my_method(my_proc)

def cool_method(&my_block)
    my_block.call
end

cool_method { puts "cool" }

arr = ["1","2","3"]

p arr.map(&:to_i)

def cool_method
    yield
end

my_proc = Proc.new { puts "proc party" }

cool_method(&my_proc)

