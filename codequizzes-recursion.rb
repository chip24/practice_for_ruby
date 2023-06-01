=begin
def factorial(n)
    if n == 1
        return 1
    end

    n * factorial(n - 1)
    
end

puts factorial(6)



def palindrome(word)
    orig_word = word
    n = word.length
    puts n
    puts word
    until n <= 1
        if word[0] != word[-1]
            puts word[0]
            puts word[-1]
            puts "#{orig_word.upcase()} is not a palindrome!"
            return false
        else
            word = word[1...-1]
            puts word
            n = n -2
            puts n
        end
    end
    puts "#{orig_word.upcase()} is a palindrome!"
end

palindrome("whatever")
palindrome("madam")
palindrome("character")
palindrome("otto")
palindrome("a")

def palindrome_recursive(word)
    
    if word.length <= 1
        puts "This is a palindrome."
        return true
    else
        if word[0] == word[-1]
            new_word = word.slice(1...-1)
            palindrome_recursive(new_word)
        else
            puts "This is not a palindrome."
            return false
        end

    end
        

end

palindrome_recursive("whatever")
palindrome_recursive("madam")
palindrome_recursive("character")
palindrome_recursive("otto")
palindrome_recursive("a")

def bottles_of_beer(number)
    if number == 0
        puts "no more bottles of beer on the wall."
        return
    else
        puts "#{number} bottles of beer on the wall.\n"
        bottles_of_beer(number -1)
    end
end

bottles_of_beer(0)
bottles_of_beer(5)
#bottles_of_beer(1000)
=end
def fibonacci(n, total = 1, fib_arr =[])
    orig_num = n
    fib_arr << 0
    fib_arr << 1
    if n == 0
        puts "The fibonacci value at position 0 is 0."
        return
    elsif n == 1
        puts "The fibonacci value at position 1 is 1."
        return
    else
        #until n <=2
        p fib_arr
        sum = fib_arr[-1] + fib_arr[-2]
        puts "The sum is #{sum}"
        #fib_arr.append(sum)
        p fib_arr
        fibonacci(n-1, total += sum, fib_arr<< sum)
        #puts "N-1 is #{n-1}"
        #puts "N-2 is #{n-2}"
        #puts "The total is #{total}"
        return
        
    end
    puts "The value at #{orig_num} is #{total}."
end

def new_fibonacci(n, total=1)
    fib_arr = [0,1]
    if n >= 2
        until n == 2
        sum = fib_arr[-2] + fib_arr[-1]
        fib_arr << sum
        new_fibonacci(n-1, total += sum)
        end
    elsif n == 1
        puts "The fibonacci number at position 1 is 1."
    elsif n == 0
        puts "The fibonacci number at position 0 is 0."
    else
        puts "Negative numbers do not work."
    end

    #puts "The fibonacci number at position #{n} is #{total}."
end

#new_fibonacci(0)
#new_fibonacci(1)
#new_fibonacci(-1)
#new_fibonacci(2)
#new_fibonacci(3)

#fibonacci(0)
#fibonacci(1)
#fibonacci(2)
#fibonacci(3)
#fibonacci(4)
#fibonacci(5)
#fibonacci(15)

def real_fib(n, fib_arr = [0,1])
    
    if n == 0
        puts "The fibonacci value at index 0 is 0"
        return
    elsif n == 1
        puts "The fibonacci value at index 1 is 1"
        return
    else
        while n > 1
        sum = fib_arr[-2] + fib_arr[-1]
        #fib_arr << sum
        p fib_arr
        real_fib(n-1, fib_arr << sum)
        
        return
        end
        p fib_arr
    end
    p fib_arr
    puts "THE fibonacci value at index #{n} is #{fib_arr[n]}"
end

#real_fib(0)
#real_fib(1)
#real_fib(2)
#real_fib(3)
#real_fib(4)
#real_fib(5)
#real_fib(6)

def fib(n, fib_arr = [0,1])
    if n <= 1
        puts "The fibonacci value at position #{n} is #{n}."
        return
    else    
        p fib_arr
        sum = fib_arr[-2] + fib_arr[-1]
        puts "The sum is #{sum}"
        #fib_arr << sum
        #p fib_arr
        #fib(n-1, fib_arr << sum)
        
    end
        fib(n-1, fib_arr << sum)
        p fib_arr
    #return

end

#fib(0)
#fib(1)
#fib(2)
#fib(3)
#fib(4)
#fib(5)
#fib(6)
#fib(7)
#fib(8)
#fib(9)
#fib(10)

def fib_seq(num)
    if num < 0 then
        raise ArgumentError, "The number must be zero or greater"
    end

    if num == 0
        p "[]"
        return []
    end

    if num == 1
        p "[0]"
        return [0]
    end

    if num == 2
        p "[0,1]"
        return [0,1] 
    end

    seq = fib_seq(num - 1)

    seq << seq[-2] + seq[-1]

    p seq
    return seq 
end

#fib_seq(0)
#fib_seq(1)
#fib_seq(2)
#fib_seq(3)
#fib_seq(4)
#fib_seq(10)

def flatten_array(arr)
    fa = arr.flatten 
    p fa 
end

#flatten_array([[1, 2], [3, 4]])
#flatten_array([[1, [8, 9]], [3, 4]])

def recursive_flatten(arr, results =[])
    arr.each do |element|
        if element.class == Array
            recursive_flatten(element, results)
        else
            results << element
        end
    end

    #p results
    results
end

#p recursive_flatten([[1, 2], [3, 4]])
#p recursive_flatten([[1, [8, 9]], [3, 4]])

def roman(num)
    orig_num = num
    results = []
    roman_mapping = {
        1000 => "M",
        900 => "CM",
        500 => "D",
        400 => "CD",
        100 => "C",
        90 => "XC",
        50 => "L",
        40 => "XL",
        10 => "X",
        9 => "IX",
        5 => "V",
        4 => "IV",
        1 => "I"
      }
      
    until num == 0
        match = roman_mapping.find { |k,v| num - k >= 0}
        p match
        results << match[1]
        num -= match[0]
        puts num
    end
    
    #p results
    puts "The roman numeral(s) for #{orig_num} are #{results.join}."
end

#roman(13)
#roman(4)
#roman(10)
#roman(2023)

def roman_recursion(num, results = [], num_arr=[])
    #orig_num = num
    #puts "Orig_num is #{orig_num}"
    #results = []
    roman_mapping = {
        1000 => "M",
        900 => "CM",
        500 => "D",
        400 => "CD",
        100 => "C",
        90 => "XC",
        50 => "L",
        40 => "XL",
        10 => "X",
        9 => "IX",
        5 => "V",
        4 => "IV",
        1 => "I"
      }

      if num <= 0
        #puts "These are the results returned by 0 #{results}."
        puts "The roman numeral(s) for #{num_arr[0]} is/are #{results.join}."
        return
      else
        match = roman_mapping.find {|k,v| num - k >= 0}
        #p match 
        num_arr << num
        results << match[1]
        p results
        p num_arr
        roman_recursion(num-match[0], results, num_arr)
      end
      
    end

    #roman_recursion(1)
    #roman_recursion(6)
    #roman_recursion(15)
    #roman_recursion(2023)

    def roman_to_int(roman_num, roman_match_arr=[])
        sum = 0
        roman_mapping = {
            "M" => 1000,
            "CM" => 900,
            "D" => 500,
            "CD" => 400,
            "C" => 100,
            "XC" => 90,
            "L" => 50,
            "XL" => 40,
            "X" => 10,
            "IX" => 9,
            "V" => 5,
            "IV" => 4,
            "I" => 1
          }
          roman_combined_arr = []
          roman_arr = roman_num.chars
          p roman_arr
          roman_arr.each_with_index do |element, index|
            puts "The element #{element} is at index #{index}."
            if element == "C" and roman_arr[index +1] == "M"
                puts "Element is C at index #{index} and M is at #{index + 1}"
                cm = element.concat(roman_arr[index+1])
                puts cm
                roman_combined_arr << cm
                p roman_combined_arr
                roman_arr.delete_at(index+1)
                
            elsif element == "C" and roman_arr[index +1] == "D"
                puts "Element is C at index #{index} and D is at #{index + 1}"
                cd = element.concat(roman_arr[index+1])
                roman_combined_arr << cd
                p roman_combined_arr
                roman_arr.delete_at(index+1)  
                
            elsif element == "X" and roman_arr[index +1] == "C"
                puts "Element is X at index #{index} and C is at #{index + 1}"
                xc = element.concat(roman_arr[index+1])
                roman_combined_arr << xc
                p roman_combined_arr 
                roman_arr.delete_at(index+1)
            elsif element == "X" and roman_arr[index +1] == "L"
                puts "Element is X at index #{index} and L is at #{index + 1}"
                xl = element.concat(roman_arr[index+1])
                roman_combined_arr << xl
                p roman_combined_arr
                roman_arr.delete_at(index+1)
            elsif element == "I" and roman_arr[index +1] == "X"
                puts "Element is I at index #{index} and X is at #{index + 1}"
                ix = element.concat(roman_arr[index+1])
                roman_combined_arr << ix 
                p roman_combined_arr
                roman_arr.delete_at(index+1)
            elsif element == "I" and roman_arr[index +1] == "V"
                puts "Element is I at index #{index} and V is at #{index + 1}"
                iv = element.concat(roman_arr[index+1])
                roman_combined_arr << iv
                p roman_combined_arr
                roman_arr.delete_at(index+1)
            else
                roman_combined_arr << element
                puts "#{roman_combined_arr} is the combined Roman array in the else statement."
            end

        end

        puts "The combined Roman array is #{roman_combined_arr}"
            



          p roman_arr
          roman_combined_arr.each do |element|
            roman_mapping.each do |key, value|
                if element == key
                    roman_match_arr << key
                    sum += value
                    p roman_match_arr
                    puts sum
                end
            end
        end

        puts "The value of #{roman_num} is #{sum}."

        end

        #roman_to_int("MMXXIII")
        #roman_to_int("III")
        #roman_to_int("IV")
        #roman_to_int("DCCLXXXIX")
        #roman_to_int("IX")
        #roman_to_int("XI")
        #roman_to_int("MCMXII")
        #roman_to_int("CD")
        #roman_to_int("XC")
        #roman_to_int("CMCDXC")
        #roman_to_int("XXXIX")
        #roman_to_int("CCXLVI")


def roman_to_int_recursion(roman_num,sum = 0, roman_arr = [],roman_combined_arr =[])
    #roman_arr = []
    roman_mapping = {
        "M" => 1000,
        "CM" => 900,
        "D" => 500,
        "CD" => 400,
        "C" => 100,
        "XC" => 90,
        "L" => 50,
        "XL" => 40,
        "X" => 10,
        "IX" => 9,
        "V" => 5,
        "IV" => 4,
        "I" => 1
      }
      if roman_arr.empty? == true
        roman_arr = roman_num.chars
        p roman_arr

        roman_arr.each_with_index do |element, index|
            #puts "The element #{element} is at index #{index}."
            if element == "C" and roman_arr[index +1] == "M"
                #puts "Element is C at index #{index} and M is at #{index + 1}"
                cm = element.concat(roman_arr[index+1])
                #puts cm
                roman_combined_arr << cm
                #p roman_combined_arr
                roman_arr.delete_at(index+1)
                
            elsif element == "C" and roman_arr[index +1] == "D"
                #puts "Element is C at index #{index} and D is at #{index + 1}"
                cd = element.concat(roman_arr[index+1])
                roman_combined_arr << cd
                #p roman_combined_arr
                roman_arr.delete_at(index+1)  
                
            elsif element == "X" and roman_arr[index +1] == "C"
                #puts "Element is X at index #{index} and C is at #{index + 1}"
                xc = element.concat(roman_arr[index+1])
                roman_combined_arr << xc
                #p roman_combined_arr 
                roman_arr.delete_at(index+1)
            elsif element == "X" and roman_arr[index +1] == "L"
                #puts "Element is X at index #{index} and L is at #{index + 1}"
                xl = element.concat(roman_arr[index+1])
                roman_combined_arr << xl
                #p roman_combined_arr
                roman_arr.delete_at(index+1)
            elsif element == "I" and roman_arr[index +1] == "X"
                #puts "Element is I at index #{index} and X is at #{index + 1}"
                ix = element.concat(roman_arr[index+1])
                roman_combined_arr << ix 
                #p roman_combined_arr
                roman_arr.delete_at(index+1)
            elsif element == "I" and roman_arr[index +1] == "V"
                #puts "Element is I at index #{index} and V is at #{index + 1}"
                iv = element.concat(roman_arr[index+1])
                roman_combined_arr << iv
                #p roman_combined_arr
                roman_arr.delete_at(index+1)
            else
                roman_combined_arr << element
                #puts "#{roman_combined_arr} is the combined Roman array in the else statement."
            end
            #puts "The combined Roman array is #{roman_combined_arr}"
        end
    end



    puts "The combined Roman array is #{roman_combined_arr}"
    
    
    if roman_combined_arr.length <= 0
        puts "The roman numeral #{roman_num} equals #{sum}."
        return
    else
        match = roman_mapping.find {|k,v| k == roman_combined_arr[0]}
        p match
        sum += match[1]
        puts "The sum is #{sum}."
        roman_combined_arr.delete_at(0)
        p roman_combined_arr
        roman_to_int_recursion(roman_num, sum, roman_arr, roman_combined_arr)
    end
    
    
    



    end

    roman_to_int_recursion("MMXXIII")
    roman_to_int_recursion("DCCLXXXIX")
    roman_to_int_recursion("MCMXII")

      








    
    


    

    
        



