# Binary Tree on YouTube from Conner Jensen 

class BinaryTree
    
    attr_accessor :root
    
    def initialize(node)
        self.root = node
    end

    def find(value)
        return true if root.value == value

        return find_helper(root, value)

    end

    def find_helper(node, value)
        return if node.nil?

        return true if node.value == value

        found = false
        found = find_helper(node.left, value)
        return found if found == true
        find_helper(node.right, value)
    end
    
        
end

class Node
    
    attr_accessor :left, :right, :value

    def initialize(left = nil, right = nil, value=nil)
        self.left = left
        self.right = right
        self.value = value
    end

end

root = Node.new(nil, nil, 1)
child = Node.new(nil, nil, 2)
left_childs_child = Node.new(nil, nil, 3)
child.left = left_childs_child
root.left = child
bt = BinaryTree.new(root)
puts bt.root.value
puts bt.root.left.value
puts bt.root.right
puts bt.find(3)

# Binary Search Tree on YouTube from Jesus Castello

class TreeNode

    attr_accessor :value, :left, :right

    def initialize(value)
        @value = value
    end

    def find_node(node, value)
        return false unless node 
        return true if node.value == value

        find_node(node.left, value) || find_node(node.right, value)
    end

    def find_node_also(node, value)
        # the stack keeps track of nodes you havn't visited yet
        stack = [node]
        p "This is the stack at the beginning of th call: #{stack}"

        until stack.empty?
            node = stack.pop
            
            return true if node.value == value

            stack << node.left if node.left
            p "This is the stack after the left node was added: #{stack}"
            stack << node.right if node.right
            p "This is the stack after the right node was added: #{stack}"

        end

        false
    end


    

end

tree = TreeNode.new(5)
tree.left = TreeNode.new(3)
tree.right = TreeNode.new(8)
tree.left.left = TreeNode.new(2)
tree.left.right = TreeNode.new(1)

pp tree
