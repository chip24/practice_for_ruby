class Node
    attr_accessor :left, :right, :data

    def initialize(data)
        @data = data
        @left = nil
        @right = nil
    end
end

class Tree
    attr_accessor :root, :data

    def initialize(array)
        @data = array.sort.uniq
        @root = build_tree(array)
    end

    def build_tree(array)
        return nil if array.empty?
        # middle = the midpoint index of the array, not the value of the midpoint
        middle = (array.size - 1)/2
        #puts "The midpoint of the array is #{middle}"
        root_node = Node.new(array[middle])
        p root_node
        root_node.left = build_tree(array[0...middle])
        
        root_node.right = build_tree(array[(middle+1)..-1])

        root_node
        #p root_node.data
    end

    def insert(value, node = root)
        # will not insert the data if that data is the same as the root data because we do not want duplicate data
        return nil if value == node.data
        # look to the left of the root if the data value is less than the root data since lower values go on the left

        # the ternary operator is an abbreviated way of writing if...then...else...then statements.
        # <Test Condition> ? <if test condition is tree do this> : <else do this>
        # if the node on the left of the root is nil, insert this new data there. Else, recursively call the insert method on the node to the left of the root
        if value < node.data
            node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
        # if the data is not less than the root (i.e. greater than the root) look to the right since values higher than the root go there
        else
            node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
        end
    end

    def delete(value, node = root)
        #start looking for value at the root.  If there is no value in the root, the BST is empty so return nil
        return node if node.nil?
        # if the value is less than the value of the root, look for that value to the left of the root recursivelt until it's found
        if value < node.data
            #puts "The value of the node to the left of the node is #{node.left.data}"
            node.left = delete(value, node.left)
            
        # if the value is greater than the value of the of the root, look for it recursively to the right of the root
        elsif value > node.data
            puts "The value of the node to the right of the node is #{node.right.data}"
            node.right = delete(value, node.right)
        else
            #puts "The value of the node to the right which was returned is #{node.right.data}"
            return node.right if node.left.nil?
            #puts "The value of the node to the left which was returned is #{node.left.data}"
            return node.left if node.right.nil?

            leftmost_node = leftmost_leaf(node.right)
            puts "The value of the leftmost_node is #{leftmost_node.data}"
            node.data = leftmost_node.data
            node.right = delete(leftmost_node.data, node.right)
        end
        p "The value of the node selected was #{node.data}"
        node
    end

    def leftmost_leaf(node)
        node = node.left until node.left.nil?

        node
    end
    
    def find(value, node = root)
        return node if node.nil? || node.data == value

        value < node.data ? find(value, node.left) : find(value, node.right)
        
    end

    def level_order(node = root, queue = [])
        # the print command will print all of the information on the same line while the puts command will add a new line at the end of each object
        print "#{node.data} "
        queue << node.left unless node.left.nil?
        queue << node.right unless node.right.nil?
        return if queue.empty?
        
    
        level_order(queue.shift, queue)
    end

    def preorder(node = root)
        return if node.nil?

        print "#{node.data} "
        preorder(node.left)
        preorder(node.right)
    end

    def inorder(node = root)
        return if node.nil?

        inorder(node.left)
        print "#{node.data} "
        inorder(node.right)
    end

    def postorder(node = root)
        return if node.nil?

        postorder(node.left)
        postorder(node.right)
        print "#{node.data} "
    end

    def height(node = root)
        unless node.nil? || node == root 
            # instance_of? returns true if the object is an instance of the class given in parentheses
            node = (node.instance_of?(Node) ? find(node.data) : find(node))
        end
        # returns -1 if the node doesn't exist
        return -1 if node.nil?

        [height(node.left), height(node.right)].max + 1
    end

    def depth(node = root, parent = root, edges = 0)
        return 0 if node == parent
        return -1 if parent.nil?

        if node < parent.data
            edges += 1
            depth(node, parent.left, edges)
        elsif node > parent.data
            edges += 1
            depth(node, parent.right, edges)
        else
            edges
        end
    end

    def balanced?(node = root)
        return true if node.nil?

        left_height = height(node.left)
        right_height = height(node.right)

        return true if (left_height - right_height).abs <= 1 && balanced?(node.left) && balanced?(node.right)

        false
    end
# this rebalance method does not work for some reason
    def rebalance()
        self.data = inorder_array()
        self.root = build_tree(data)
    end

    def inorder_array(node = root, array = [])
        unless node.nil?
            inorder_array(node.left, array)
            #p array
            array << node.data
            inorder_array(node.right, array)
        end
        #p array
        array 
    end




    def pretty_print(node = root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
      end


end

#arr = Array.new(15) { rand(1..100) }
#arr = [10, 6, 12, 5, 8, 11, 7, 9]
#p arr
#sorted_unique_array = arr.sort.uniq
#p sorted_unique_array


#bst = Tree.new(arr)
#bst = Tree.new(sorted_unique_array)
#bst.pretty_print
#tree.pretty_print
#bst.pretty_print
#bst.insert(77)
#bst.pretty_print
#bst.delete(1)
#bst.pretty_print
#p bst.find(11)
#p bst.find(1)
#bst.level_order()
#bst.preorder()
#bst.inorder()
#bst.postorder()
#puts bst.height()
#puts bst.depth(11)
#puts bst.balanced?()
#bst.rebalance()

array = Array.new(15) {rand(1..100)}
bst = Tree.new(array)

bst.pretty_print

puts bst.balanced? ? "You binary search tree is balanced." : "Your binary search tree is not balanced."

puts "Level order traversal: "
puts bst.level_order

puts "Preorder traversal: "
puts bst.preorder

puts "Inorder traversal: "
puts bst.inorder

puts "Postorder traversal: "
puts bst.postorder

10.times do
    a = rand(100..150)
    bst.insert(a)
    puts "Inserted #{a} into tree."
end

bst.pretty_print

puts bst.balanced? ? "You binary search tree is balanced." : "Your binary search tree is not balanced."

puts "Rebalancing tree... "
bst.rebalance

bst.pretty_print

puts bst.balanced? ? "You binary search tree is balanced." : "Your binary search tree is not balanced."

puts "Level order traversal: "
puts bst.level_order

puts "Preorder traversal: "
puts bst.preorder

puts "inorder traversal: "
puts bst.inorder

puts "Postorder traversal: "
puts bst.postorder


