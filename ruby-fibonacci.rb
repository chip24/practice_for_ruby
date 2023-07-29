def fibs(n)
    orig_num = n
    arr =[0,1]
    if n == 1
        p "[0]"
    elsif n == 2
        p arr "[0,1]"
    else
        puts n
        until n < 3 
            puts "the integer at arr[-2] at #{n} is #{arr[-2]}"
            puts "the integer at arr[-1] at #{n} is #{arr[-1]}"
            
            
            new_term = arr[-2] + arr[-1]
            puts new_term
            arr << new_term
            n = n - 1

        end
    end
    
    p "The fibonacci sequence with #{orig_num} numbers is #{arr}." 

end

#fibs(3)
#fibs(8)

def fibs_rec(n, fib_arr = [0,1])
    
    if n == 1 || n == 2
        p "The fibonacci sequence with #{fib_arr.length} terms is #{fib_arr}."
        return fib_arr
    else
        puts n
        new_term = fib_arr[-1] + fib_arr[-2]
        puts new_term
        fib_arr << new_term
        fibs_rec(n-1,fib_arr)
    end
end

fibs_rec(2)

