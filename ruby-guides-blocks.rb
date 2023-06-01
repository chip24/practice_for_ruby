[1,2,3].each {|num| puts num }

[1,2,3].each do |num|
    puts num 
end

def print_once
    yield
end

print_once { puts "Block is being run" }

def print_twice
    yield
    yield
end

print_twice { puts "Hello" }

def one_two_three
    yield 1
    yield 2
    yield 3
end

one_two_three { |number|
puts number * 10 }

def explicit_block(&block)
    block.call
end

explicit_block { puts "Explicit block called" }

def do_something_with_block
    return "No block given" unless block_given?
    yield
end

say_something = -> {puts "This is a lamdba"}

say_something.call

times_two = -> (x) {x*2}

puts times_two.call(10)

my_proc = Proc.new { |x| puts x}

t = Proc.new {|x,y| puts "I don't care about arguments!"}
t.call

my_lambda = -> {return 1}
puts "Lambda result: #{my_lambda.call}"

# This does not work.
#my_proc = Proc.new {return 1}
#puts "Proc result: #{my_proc.call}"

def call_proc
    puts "Before proc"
    my_proc = Proc.new {return 2}
    my_proc.call
    puts "After proc"
end

p call_proc

def call_proc(my_proc)
    count = 500
    my_proc.call
end

count = 1
my_proc = Proc.new {puts count}

p call_proc(my_proc)

puts "IS THIS WORKING?!"

def return_binding
    foo = 100
    binding
end

puts return_binding.class
puts return_binding.eval('foo')





















