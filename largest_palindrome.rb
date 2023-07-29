def large_pal()
    largest = 0
    for a in (100...1000).to_a.reverse do
        for b in (100...a).to_a.reverse do
            c = a * b 
            puts c
            
            if c > largest && c.to_s == c.to_s.reverse
                largest = c
            end
            if c < largest
                break
            end

        end
    end
    puts "The largest palindrome is #{largest}."
            


end

large_pal()

    