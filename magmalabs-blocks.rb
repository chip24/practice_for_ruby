
2.times do
    puts "foo"
end

2.times {puts "foo"}

1.upto(5) {|i| puts(i)}
=begin
def with_benchmark
    start_time = Time.now
    puts "Starting benchmark at #{start_time}"

    yield

    stop_time = Time.now
    puts "The method took #{stop_time - start_time} seconds to complete"
end

with_benchmark do 
    puts "poo poo" * 40
end

def with_benchmark_two(expected_time)
    start_time = Time.now
    puts "Starting benchmark at #{start_time}"

    result = yield

    stop_time = Time.now
    puts "The method took #{stop_time - start_time} to complete"

    if result > expected_time
        puts "Failed! Took too long to complete"
    else
        puts "Passed!  That was super fast!"
    end
end

with_benchmark_two(5) do
    puts "poo poo pee pee " *4
end
=end
rocks = 30.times.map{rand(200) + 1}
puts rocks.join(', ')
max_rock = 0

rocks.each do |rock|
    max_rock = rock if max_rock < rock
end

puts "Heaviest rock is #{max_rock}"

puts "Heaviest rock is: #{rocks.inject{|max_rock, rock| max_rock > rock ? max_rock : rock}}"

def rock_judger(rocks_arr)
    if rocks_arr.length <= 2
        a = rocks_arr[0]
        b = rocks_arr[-1]
    else
        a = rock_judger(rocks_arr.slice!(0, rocks_arr.length/2))
        b = rock_judger(rocks_arr)
    end

    return a > b ? a : b 
end

rocks = 30.times.map{rand(200) + 1}
puts rocks.join(', ')
puts "Heaviest rock is #{rock_judger(rocks)}"

def rock_judger(r_arr)
    count = r_arr.length
    a, b = count <= 2 ? [r_arr[0], r_arr[-1]] : [rock_judger(r_arr.pop(count/2)), rock_judger(r_arr)]
    return a > b ? a : b
end

rock_array = 30.times.map{rand(200) + 1}
p rock_array
puts "The heaviest rock is #{rock_judger(rock_array)}"

def countdown(n)
    while n >= 0
        puts n
        n -= 1    
    end
    puts "Hooray!"
end

countdown(10)

def countdown_recursive(n)
    if n <= 0
        puts "Hooray!"
        return
    end

    puts n
    countdown_recursive(n-1)
end

countdown_recursive(10)

def sum_range(n)
    total = 0
    while n >= 0
        total += n 
        n -= 1
    end
    puts "The sum is #{total}"
end

sum_range(3)


def recursive_sum(n, total = 0)
    if n <= 0
        puts "The recursive sum is #{total}."
        return total
    end

    return recursive_sum(n-1, total + n)
end


recursive_sum(4)

def factorial(n)
    if n == 1
        return 1
    else
        n * factorial(n-1)
    end
end

puts factorial(5)

def collatz(n, start_number, count = 0)
    
    if n == 1
        puts "It took #{count} steps to get to 1 from #{start_number}."
        return
    elsif n % 2 == 0
        collatz(n/2, start_number,count + 1)       
    else
        collatz(3*n + 1, start_number, count + 1)
        
    end
    #puts "It took #{count} steps to get to 1 from #{n}."
end
collatz(1,1)
collatz(2,2)
collatz(3,3)
#collatz(4)
#collatz(7)
collatz(27,27)

word = "boogers".slice(1...-1)
p word

