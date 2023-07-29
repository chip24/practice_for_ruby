class Node

    attr_accessor :value, :parent, :left, :right
    def initialize(value, parent = nil, left = nil, right = nil)
        @value = value
        @parent = parent
        @left = left 
        @right = right
    end
end

class Tree

    attr_accessor :root
    
    def initialize(array)
        @root = build_tree(sorted_array(array))
    end

    def sorted_array(array)
        array.uniq.sort
    end

    def build_tree(array)
            return if array.empty?
            mid = array.length / 2
            #puts "The index of the first term is #{first}"
            #puts "The index of the midpoint is #{mid}"
            #puts "And the midpoint is #{array[mid]}"
            #puts "The index of the last term is #{last}"
            root = Node.new(array[mid])
            #Node.new(array[mid]).tap do |root|
            #p root
            root.left = build_tree(array[0...mid])
            root.right = build_tree(array[mid + 1..-1])
            p root
        end
    


        def pretty_print(node = @root, prefix= '', is_left = true)
            pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
            puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
            pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
        end

        def insert(value, root = @root)
            return Node.new(value) if root.nil?
            
            if root.value == value
                root 
            elsif
                value < root.value
                root.left = insert(value, root.left)
            else
                root.right = insert(value, root.right)
            end
            root
        end
        def delete(value, root = @root)
            return root if root.nil?

            if value < root.value
                root.left = delete(value, root.left)
            elsif value > root.value
                root.right = delete(value, root.right)
            else
                if root.left.nil?
                    tmp = root.right
                    root = nil
                    return tmp 
                elsif root.right.nil?
                    tmp = root.left
                    root = nil
                    return tmp
                end
                del_if_two_child(root)
            end
            root
        end
        
        def del_if_two_child(root)
            tmp = min_value_node(root.right)
            root.value = tmp.value 
            root.right = delete(tmp.value, root.right)
        end

        def min_value_node(node)
            current = node
            current = current.left
            unless current.left.nil?
            end
            current
   
        end

        def find(value, root = @root)
            return root if root.value == value

            if value < root.value
                find(value, root.left)
            elsif value > root.value
                find(value, root.right)
            end
            rescue NoMethodError
                puts "Value not found!"
        end


    def inorder(root = @root, result = [])
        return if root.nil?

        inorder(root.left, result)
            result <<root.value
        inorder(root.right, result)
            result
        
    end

    def level_order(root = @root)
        result = []
        queue = [root]
        until queue.empty?
            root = queue.shift
            result << root.value
            queue << root.left unless root.left.nil?
            queue << root.right unless root.right.nil?
            end
            p result
            result
        end

        def preorder(root = @root, result = [])
            return if root.nil?

            result << root.value
            preorder(root.left, result)
            preorder(root.right, result)
            result
        end

        def postorder(root = @root, result=[])

            return if root.nil?

            postorder(root.right, result)
            postorder(root.left, result)
            result << root.value
            result
        end

        def height(node = @root)
            return -1 if node.nil?

            [height(node.left), height(node.right)].max + 1
        end

        def depth(node)
            if node.value < @root.value
                height(@root.left) - height(node) +1
            else
                height(@root.right) - height(node) + 1
            end
        end

        def balanced?
            (height(@root.left) - height(@root.right)).abs <= 1
        end

        def rebalance
            @root = build_tree(sorted_array(level_order))
        end

end

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
#sorted_arr = arr.sort.uniq
#p sorted_arr
#n = sorted_arr.length
#puts n

bst = Tree.new(arr)
#p bst.sorted_arr
#bst.sorted_array(arr)
#last = @sorted_arr.length
#puts last
#bst.build_tree(bst.sorted_arr, 0, bst.sorted_arr.length-1)
#p bst
#bst.pretty_print
#bst.insert(40)
#bst.pretty_print
#bst.delete(40)
#bst.pretty_print
#bst.delete(67)
#bst.pretty_print
#bst.insert(67)
#bst.pretty_print
#p bst.find(67)
#bst.find(68)
#bst.level_order()
#p bst.inorder()
#p bst.preorder()
#p bst.postorder()
#p bst.height()
#p bst.balanced?()
#p bst.rebalance()
#bst.pretty_print()

tree = Tree.new(Array.new(15) {rand(1..100)})
tree.pretty_print
puts tree.balanced? ? "\nThe tree is balanced\n" : "\nThe tree is not balanced"

puts "\nLevel-order traversal array #{tree.level_order}"

puts "\nPre-order traversal array #{tree.preorder}"

puts "\nPost-order traversal array #{tree.postorder}"

puts "\nIn-order traversal array #{tree.inorder}"

puts "\nInserting elements..."
tree.insert(101)
tree.insert(102)
tree.insert(103)
tree.insert(104)
tree.insert(105)
tree.insert(106)

puts tree.balanced? ? "\nThe tree is balanced\n" : "\nThe tree is not balanced\n\n"

tree.pretty_print

puts "\nRebalancing the tree...\n\n"

tree.rebalance

tree.pretty_print

puts tree.balanced? ? "\nThe tree is balanced\n" : "\nThe tree is not balanced\n\n"

puts "\nLevel-order traversal array #{tree.level_order}"

puts "\nPre-order traversal array #{tree.preorder}"

puts "\nPost-order traversal array #{tree.postorder}"

puts "\nIn-order traversal array #{tree.inorder}"





