class Node 
    attr_accessor :value, :next_node

    def initialize(value, next_node = nil)
        @value = value
        @next_node = next_node
    end
end

class LinkedList 
    attr_accessor :tail, :head
    def initialize
        @head = nil
        @tail = nil
    end

    def add_first(data)
        @head = Node.new(data, @head)
    end

    def add_last(data)
        node = Node.new(data)
        if !@head
            @head = node 
            @tail = node 
            return
        end
        last_node = get_last()
        last_node.next_node = node 
        @tail = node 
    end
    
    def add_at(index, data)
        if !@head
            @head = Node.new(data)
            return
        end
        if index == 0
            add_first(data)
            return
        end

        previous = get_node(index-1) || get_last()
        node = Node.new(data, previous.next_node)
        previous.next_node = node
    end

    def remove_first
        return nil if !@head
        p @head
        p @head.next_node
        p @tail
        @head = @head.next_node
    end

    def remove_last
        return nil if !@head
        if !@head.next_node
            @head = nil
            return 
        end

        prev = @head
        node = @head.next_node
        while node.next_node do
            node = node.next_node
            prev = prev.next_node
        end
        @tail = prev 
        prev.next_node = nil
    end

    def remove_at(index)
        return if !@head
        if index == 0
            @head = @head.next_node
            return
        end

        previous= get_node(index-1)
        if !previous || !previous.next_node
            return
        end

        previous.next_node = previous.next_node.next_node
    end

    def clear 
        @head = nil
        @tail = nil
    end

    def size 
        return 0 if !@head
        node = @head
        counter = 0
        while node do
            node = node.next_node
            counter += 1
        end
        counter
    end

    def get_first
        @head.value
    end

    def to_s
        result = []
        current = @head
        while current.next_node !=nil
            result << current.value
            current = current.next_node
        end
        result << current.value
        result << nil
        p result
        puts result
        for i in result
            if i == nil
                print "nil"
            #elsif i.integer? == false
             #   print ""
            else
                print "(#{i.to_s}) -> "
            end
        end

        #"(#{@value}) ->"
    end

private

    def get_last
        return if !@head
        node = @head
        until node.next_node.nil?
            node = node.next_node
        end
        return node 
    end

    def get_node(index)
        return if !@head
        return @head if index === 0

        node = @head
        counter = 0
        until node.next_node.nil?
            node = node.next_node
            counter += 1
            return node if counter === index 
        end
    end


end

list = LinkedList.new
list.add_first(2)
list.add_last(4)
list.add_last(6)
list.add_last(8)
list.add_last(10)
list.add_last(12)
list.add_last(14)
list.add_last(16)
list.add_last(18)
list.add_last(20)
list.add_last(22)
list.add_last(24)
list.add_last(26)

p list.size

p list.get_first

#list.remove_at(10)
p list.size
#list.remove_first
#list.remove_last
p list.size
puts list
#p list
