def multiples()
    num = 1
    sum = 0
    until num == 999
        if num % 3 == 0 || num % 5 == 0
            sum += num 
            
        end
        num += 1
    end
    puts sum
end

#multiples()

def multiples_recursion(num = 1, sum = 0)
    #sum = 0
    if num >= 1000
        puts "The final sum is #{sum}."
        return sum
    else
        if num % 3 == 0 || num % 5 == 0
        sum += num
        puts "#{num} is a multiple of 3 or 5"
        puts sum
        #multiples_recursion(num + 1)
        end
        multiples_recursion(num + 1, sum)
    end
end

#multiples_recursion()

def prime_factor(num)
    factors = []
    i = 2
    until i >= num
        
        if num % i == 0
            puts "The divisor is #{i}."
            factors << i
            p factors
            #prime_factor(i)
            
        end
            
            i += 1
             
    end
    return factors
end


def only_prime_factors(arr)
    primes = []
    not_primes = []
    divisor = 2
    arr.each do |num|
        #p arr
        while divisor < num
        puts num
        puts "The current divisor is #{divisor}."
        modulo = num % divisor
        puts "The modulo of #{num} and #{divisor} is #{modulo}"
        if num % divisor == 0
            not_primes << num
            
            break
            #divisor += 1
        end
        divisor += 1
        end
        divisor = 2
        
        p "The factors that are not prime are #{not_primes}."   
    end
    
    primes = arr - not_primes
    p "The prime factors are #{primes}"
    p "The largest prime factor is #{primes[-1]}"
        
            
        
end

#only_prime_factors(prime_factor(13195))
#only_prime_factors(prime_factor(600851475143))

def prime_factorization(num)
    primes = []
    orig_num = num
    divisor = 2
    while orig_num >= divisor * divisor
      if num % divisor == 0
        puts "The number is #{num}"
        puts "The divisor is #{divisor}"
        primes << divisor
        p primes
        num = num/divisor
        puts "The new number is #{num}."
        
      else
        divisor += 1
      end
    end
      p primes
      puts "The largest prime factor of #{orig_num} is #{primes[-1]}."
    end
  
  #prime_factorization(13195)
  #prime_factorization(60)
    

def prime_factorization_recursive(num, orig_num = num, divisor = 2, primes = [])
    #orig_num = num
    if orig_num <= divisor * divisor
        p "The prime factors are #{primes}"
        puts "The largest prime factor is #{primes[-1]}."
        return
        
    else 
        #while orig_num >= divisor * divisor
            if num % divisor == 0
                puts "The number is #{num}."
                puts "The divisor is #{divisor}"
                primes << divisor
                p primes
                puts "The original number is #{orig_num}"
                prime_factorization_recursive(num/divisor, orig_num, divisor, primes)
            else
                prime_factorization_recursive(num, orig_num,divisor+1, primes)
            end
        #end
    end

end

#prime_factorization_recursive(60)
#prime_factorization_recursive(13195)

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

#large_pal()

def smallest_multiple()
  # on 6/24 find out how to control this loop with true and false  
    num = 20

    while true do
        if num % 20 == 0 && num % 19 == 0 && num % 18 == 0 && num % 17 == 0 && num % 16 == 0 && num % 15 == 0 && num % 14 == 0 && num % 13 == 0 && num % 12 == 0 && num % 11 == 0 && num % 10 == 0 && num % 9 == 0 && num % 8 == 0 && num % 7 == 0 && num % 6 == 0 && num % 5 == 0 && num % 4 == 0 && num % 3 == 0 && num % 2 == 0
            puts "#{num} is the lowest number divisible by all numbers between one and twenty."
            return false
    else
        num += 20
        #puts num
    end
end

end

smallest_multiple()

#smallest_multiple_recursive()




