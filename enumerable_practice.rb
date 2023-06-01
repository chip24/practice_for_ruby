friends = ["Sharon","Leo","Leila","Brian","Arun"]
invited_list = []

for friend in friends do
  if friend != "Brian"
    invited_list.push(friend)
  end
end

puts invited_list
p invited_list

friends.select{|friend| friend != "Brian"}

friends.each { |friend| puts "Hello, " + friend }

my_array = [1,2]

my_array.each do |num|
  num *= 2
  puts "The new number is #{num}."
end

my_hash = {"one" => 1, "two" => 2}

my_hash.each {|key, value| puts "#{key} is #{value}" }

my_hash.each {|pair| puts "The pair is #{pair}"}

shouting_at_friends = []

friends.each {|friend| shouting_at_friends.push(friend.upcase)}

puts shouting_at_friends

fruits = ["apple","banana","strawberry","pineapple"]

friends.map {|friend| friend.upcase}

puts friends

fruits.each_with_index {|fruit,index| puts fruit if index.even?}

my_order = ['medium Big Mac','medium fries','medium milkshake']

my_order.map{|item| item.gsub('medium','extra large')}

puts my_order

salaries = [1200,1500,1100,1800]

salaries.map {|salary| salary-700}
