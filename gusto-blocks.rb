def star_wrap(el)
    puts "*" + el + "*"
end
star_wrap("@")

def star_wrap
    puts "*" + yield + "*"
end

star_wrap do
    "@"
end

def wrap_with(el)
    puts el + yield + el 
end

wrap_with("*") do
    "@"
end

def wrap_with(el)
    puts el * 5
    puts yield(el * 2)
    puts el * 5
end

wrap_with("*") do |els|
    els + "@" + els
end

def star_wrap
    puts "***"
    puts yield
    puts "***"
end

def star_wrap
    if block_given?
        puts "*" + yield + "*"
    else
        puts "***"
    end
end

star_wrap

#def star_wrap(&block)
#    puts "*" + block.call + "*"
#end

#star_wrap do
#    puts "@"
#end

def star_wrap_a(&block)
    puts "*" + block.call("#") + "*"
end

def star_wrap_b
    puts "*" + yield("#") + "*"
end

star_wrap_a do |el|
    el + "@" + el
end

star_wrap_b do |el|
    el + "@" + el 
end



    

