class Node
    include Comparable
    attr_accessor :data, :left, :right

    def initialize(data = nil, left = nil, right = nil)
        @data = data
        @left = left
        @right = right 
    end

    def to_s
        @data.to_s
    end

    def <=>(other)
        value = other.class == Node ? other.data : other
        data <=> value
    end
end

class Tree 
    
    # When a new instance of Tree is created, the initialize method will be called automatically.  For this Tree class, you will need to pass an array as an argument when creating a new instance of Tree.   Then, the instance variable called @root will be created and will call the build_tree method on the array passed as an argument.  The initial value of @root will be @root is needed in order to be able access this information later. 
    def initialize(array)
        @root = build_tree(array)
    end

    def build_tree(array)
        return if array.empty?

        result = array.sort.uniq
        p result
        return Node.new(result[0]) if result.length <= 1

        middle = result.length/2
        root = Node.new(result[middle])
        root.left = build_tree(result[0...middle])
        root.right = build_tree(result[middle + 1..-1])
        root
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
      end
end

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

bst = Tree.new(arr)
p bst
bst.pretty_print


    


