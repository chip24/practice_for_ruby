def mergesort(array)
    return array if array.length == 1
    middle = array.length / 2
    merge mergesort(array[0...middle]), mergesort(array[middle..-1])
  end
  
  
  def merge(left, right)
    result = []
    until left.length == 0 || right.length == 0 do
      result << (left.first <= right.first ? left.shift : right.shift)
    end
    result + left + right
  end

  p mergesort([8,3,2,9,7,1,5,4])