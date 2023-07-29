class Node

    attr_accessor :data, :next

    def initialize(data, next_node = nil)
        @data = data
        @next = next_node
    end

end

class LinkedList

    def is_empty?
        if @head == nil
            return true
        else
            return false
        end
    end

    def push(data)
        if self.is_empty?
            @head = Node.new(data)
        else
            current_node = @head
            new_node = Node.new(data)
            while current_node.next != nil
                current_node = current_node.next
            end
            current_node.next = new_node
        end
    end

    # add a new node to the front of the list
    def unshift(data)
        if self.is_empty?
            @head = Node.new(data)
        else
            curr_head = Node.new(data)
            curr_head.next = @head
            @head = curr_head
        end
    end

    def pop 
        if self.is_empty?
            return "This list is currently empty."
        else 
            current_node = @head
            while current_node.next.next != nil
                current_node = current_node.next
            end
            last_node = current_node.next
            current_node.next = nil
        end
        last_node
    end

    # remove the first node and return it
    def shift
        if self.is_empty?
            return "This list is currently empty."
        else
            curr_head = @head
            new_head = @head.next
            @head.next = nil
            @head = new_head
        end
        curr_head
    end

    def size
        if self.is_empty?
            count = 0
        else
            count = 1
            current_node = @head
            while current_node.next != nil
                current_node = current_node.next
                count += 1
            end
        end
        count
    end

    def pretty_print
        array = []
        current_node = @head
        if self.is_empty?
            return array 
        else
            while current_node.next != nil
                array << current_node.data
                current_node = current_node.next
            end
            array << current_node.data
        end
        p array 
    end
    
    def clear
        @head = nil 
    end
end

list = LinkedList.new

list.push(1)
list.push(2)
list.push(3)
list.push(4)
p list

list.unshift(0)
p list
list.pretty_print
p list.size




