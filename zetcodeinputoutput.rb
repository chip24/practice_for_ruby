f = File.open("output.txt", "w")
f.puts "The Ruby tutorial"
f.close

File.open("langs.txt","w") do |f|
    f.puts "Ruby"
    f.write "Java\n"
    f << "Python\n"
end

puts File.exists? "tempfile"

f = File.new "tempfile", "w"
puts File.mtime "tempfile"
puts f.size

File.rename "tempfile", "tempfile2"

f.close

f = File.open("stones.txt")
while line = f.gets do
    puts line
end

f.close

fname = "spaced-letters.rb"

File.readlines(fname).each do |line|
    puts line
end

Dir.mkdir "tmp"
puts Dir.exists? "tmp"

puts Dir.pwd
Dir.chdir "tmp"
puts Dir.pwd

Dir.chdir ".."
puts Dir.pwd
Dir.rmdir "tmp"
puts Dir.exists? "tmp"

fls = Dir.entries '.'
#puts fls
#p fls
puts fls.inspect

puts Dir.home
puts Dir.home "root"

data = system 'ls'
puts data