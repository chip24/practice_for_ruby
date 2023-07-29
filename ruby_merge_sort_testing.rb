def merge(arr_a=[])
      arr_b = [2]
      arr_c = [1]
      i_b = 0
      i_c = 0
      i_a = 0
  
      p arr_c[i_c..arr_c.length]
  
      while i_b < arr_b.length && i_c < arr_c.length
          puts "The value of arr_b at index #{i_b} is #{arr_b[i_b]}"
          puts "The value of arr_c at index #{i_c} is #{arr_c[i_c]}"
          #p arr_a
          if arr_b[i_b] < arr_c[i_c]
              p arr_b[i_b]
              p arr_c[i_c]
              #arr_a.insert(i_a, arr_b[i_b])
              arr_a << arr_b[i_b]
              p "arr_a equals #{arr_a}"
              i_b += 1
          elsif
            arr_c[i_c] < arr_b[i_b]
              #arr_a.insert(i_a, arr_c[i_c])
              arr_a << arr_c[i_c]
              p "ARR_A is #{arr_a}"
              i_c += 1
          end
        
      
    
      #i_a += 1
  
  
        if i_b >= arr_b.length
          puts "The rest of arr_c is #{arr_c[i_c..arr_c.length]}"
          arr_a.concat(arr_c[i_c..arr_c.length])
    
          
        elsif i_c >= arr_c.length
          puts "The rest of arr_b is #{arr_b[i_b..arr_b.length]}"
          arr_a.concat(arr_b[i_b..arr_b.length])
      
          
        end
  
      end
  p "THE FINAL ARR_A is #{arr_a}"
  
  end
  merge()
