x = 90
c = "a"
xf_var = (c + x.to_s) + c     
a = x.to_s.upcase
b = "#{a}#{x}"
xf_var += (x +xf_var.to_i).to_s
puts b + c
x = x.to_s + "variable_x" + b
puts x

variable_x = 90
carton = "a"
xf_var = (carton + variable_x.to_s) + carton      
a = variable_x.to_s.upcase
b = "#{a}#{variable_x}"
xf_var += (variable_x +xf_var.to_i).to_s
puts b + carton
variable_x = variable_x.to_s + "variable_x" + b
puts variable_x

puts x.object_id
puts variable_x.object_id

tom = "kitty"
jerry = "kitty"
tom = tom + "kat"
puts tom

burrell = "Tennis"
woz = "clouds"
burrell = burrell + woz
puts woz
puts burrell

alpha = "star"
beta = alpha.upcase!
alpha = beta.downcase
puts alpha
puts beta

bob = "uncle-"
earth = bob
earth << bob
mary = bob.downcase + earth.upcase! + bob.capitalize
earth << bob
puts bob  # -uncle
puts earth # -uncle
puts mary # uncle-UNCLE-Uncle

a = "hi there"
b = a
a = "not here"
puts a 
puts b

c = "hi there"
d = c
c << ", Bob"
puts c
puts d

a = [1,2,3,3]
b = a
c = a.uniq!
puts a
puts b
puts c

def test(e)
    e.map {|letter| "I like the letter: #{letter}"}
end

f = ["a", "b", "c"]
puts test(f)