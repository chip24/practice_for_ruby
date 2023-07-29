class Node 
    
    # :next_node is a pointer to the next value
    attr_accessor :value, :next_node

    def initialize(value, next_node)
        @value = value
        @next_node = next_node 
    end
end

class LinkedList 
    
    # when a new node instance is created, next_node will be initialized as nil
    def initialize(value)
        @head = Node.new(value, nil)
    end

    def addition(value)
        current_node = @head
        while current_node.next_node != nil
            current_node = current_node.next_node
        end
        current_node.next_node = Node.new(value, nil)
    end

    def find(value)
        current_node = @head
        puts current_node.value
        return false if !current_node.next_node
        return current_node if current_node.value == value
        while (current_node = current_node.next_node)
            return current_node if current_node.value == value
        end
    end

    def deletion(value)
        current_node = @head
        if current_node.value == value
            @head = current_node.next_node
        else
            while (current_node.next_node != nil) && (current_node.next_node.value != value)
                if (current_node.next_node == nil) || (current_node.next_node.value == value)
                    current_node.next_node = current_node.next_node.next_node
                else
                    current_node = current_node.next_node
                end
            end
            current_node.next_node = current_node.next_node.next_node
        end
    end

    def print_list
        current_node = @head
        print "(#{current_node.value}) --> "
        while (current_node = current_node.next_node)
            print "(#{current_node.value})--> "
        end
        print "(nil)"
    end
end

list = LinkedList.new(2)
list.addition(5)
list.addition(7)
list.addition(10)
list.deletion(5)
list.print_list



