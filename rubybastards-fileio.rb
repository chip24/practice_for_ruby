require 'rubygems'
require 'rest-client'
require 'open-uri'

=begin
f = File.open('output.txt', 'w')
f.puts "The Ruby tutorial"
f.close

fname = "sample.txt"
somefile = File.open(fname, "w")
somefile.puts "Hello, file!"
somefile.close


wiki_url = "http://en.wikipedia.org"
wiki_local_filename = "wiki-page.html"

File.open(wiki_local_filename, "w") do |file|
    file.write(RestClient.get(wiki_url))
end


file = File.open("sample.txt", "r")
contents = file.read
puts contents


contents = File.open("sample.txt", "r"){|file| file.read}
puts contents

File.open("sample.txt").readlines.each do |line|
    puts line
end
=end
=begin
file = File.open("sample.txt","r")
while !file.eof?
    line = file.readline
    puts line
end

url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
puts URI.open(url).readline

local_filename = "hamlet.txt"

File.open(local_filename, "w") do |file|
    file.write(RestClient.get(url))
end

URI.open("hamlet.txt","r") do |file|
    file.readlines.each_with_index do |line, idx|
        puts line if idx % 42 == 41
    end
end

datafile = File.open("sample.txt","r")
lines = datafile.readlines
datafile.close

#lines.each {|line| puts line}

Dir.glob("*.rb").each do |f|
    puts f 
end

path = "/home/chip/repos"
puts Dir.glob("**/*", base: path).length

DIRNAME = "/home/chip/repos"
Dir.glob("**/*").sort_by {|fname| File.size(fname)}.reverse[0..9].each do |fname|
    puts "#{fname}\t#{File.size(fname)}"
end

hash = Dir.glob("#{DIRNAME}/**/*.*").inject({}) do |hsh, fname|
    ext = File.basename(fname).split(".")[-1].to_s.downcase
    hsh[ext] ||=  [0,0]
    hsh[ext][0] +=1
    hsh[ext][1] += File.size(fname)
    hsh 
end

File.open("file-analysis.txt","w") do |f|
    hash.each do |arr|
        txt = arr.flatten.join("\t")
        f.puts txt
        puts txt
    end
end
=end

BASE_URL = "https://chart.googleapis.com/chart?cht=p&chs=500x300"
rows = File.open("file-analysis.txt"){|f| f.readlines.map{|p| p.strip.split("\t")} }

headers = rows[0]
[1,2].each do |idx|
   labels = []
   values = []
   rows[1..-1].each do |row|
      labels << row[0]
      values << row[idx]
   end
   
   remote_google_img = URI.encode"#{BASE_URL}&chl=#{labels.join('|')}&chd=t:#{values.join(',')}"
puts remote_google_img
  File.open('file-pie-chart.png', 'w'){|f| 
    f.write(open(remote_google_img))
  }
end















