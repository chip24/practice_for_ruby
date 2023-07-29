def merge_sort(arr)
  if arr.length == 1
    return arr
#elsif arr.length > 1
  else
    n = arr.length
    b = arr[0...n/2]
    c = arr[n/2..n]

    #merge(arr_b,arr_c)

    merge merge_sort(b), merge_sort(c)
  end
end


  def merge(arr_b, arr_c)
    p arr_b
    p arr_c
    arr_a =[]
    i_b = 0
    i_c = 0
    #i_a = 0

    #p arr_c[i_c..arr_c.length]

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
            p arr_b[i_b]
            p arr_c[i_c]
            #arr_a.insert(i_a, arr_c[i_c])

            arr_a << arr_c[i_c]
            p "ARR_A is #{arr_a}"
            i_c += 1
        end


      if i_b >= arr_b.length
        puts "The rest of arr_c is #{arr_c[i_c..arr_c.length]}"
        arr_a.concat(arr_c[i_c..arr_c.length])
        p "after adding the rest of arr_c, arr_a is #{arr_a}"
        return arr_a
  
        
      elsif i_c >= arr_c.length
        puts "The rest of arr_b is #{arr_b[i_b..arr_b.length]}"
        arr_a.concat(arr_b[i_b..arr_b.length])
        p "after adding the rest of arr_b, arr_a is #{arr_a}"
        return arr_a
    
        
      end
      #return arr_a
    end


    
                 
end

merge_sort([8,3,2,9,7,1,5,4])
