def lab_exists?(word)
    word.include?("lab")
end

puts lab_exists?("laboratory")
puts lab_exists?("experiment")
puts lab_exists?("Pans Labyrinth")
puts lab_exists?("elaborate")
puts lab_exists?("polar bear")

def execute(&block)
    block
  end
  
  execute { puts "Hello from inside the execute method!" }