 #initial array is [8,3,2,9,7,1,5,4]
def merge_sort(arr)

    if arr.length == 1
    return arr
#elsif arr.length > 1
    else
    n = arr.length
    #arr_b = arr[0...n/2]
    #arr_c = arr[n/2..n]
    p arr[0...n/2]
    p arr[n/2..-1]
    #merge(arr_b,arr_c)

    merge merge_sort(arr[0...n/2]), merge_sort(arr[n/2..-1])
    #merge (arr_b, arr_c)
    end
end
#merge(arr_b, arr_c)
#p "The initial array is #{arr}."
#p "Array B is #{arr_b}."
#p "Array C is #{arr_c}."
#p arr_d        



def merge(left, right)
    result = []
    until left.length == 0 || right.length == 0 do
      result << (left.first <= right.first ? left.shift : right.shift)
    end
    result + left + right
  end

  p merge_sort([8,3,2,9,7,1,5,4])