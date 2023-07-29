class Node 
    attr_accessor :value, :next_node
    def initialize(value, next_node = nil)
        @value = value
        @next_node = next_node
    end
end

class LinkedList
    def initialize
        @head = nil
        @tail = nil
    end

    def add(number)
        this_node = Node.new(number)
        if @head.nil?
            @head = this_node
            return 
        end

        current = @head
        until current.next_node.nil?
            current = current.next_node
        end
        current.next_node = this_node
    end

    def add_at(index, item)
        if @head.nil?
            this_nod = Node.new(item)
            @head = this_nod
        end
        if index == 0
            this_nod = Node.new(item,@head)
            @head = this_nod
        end
        if index > 0 
            ind = index -1
            current = @head
            before_current = @head

            ind.times do
                before_current = current.next_node
            end
            index.times do
                current= current.next_node
            end

            this_nod = Node.new(item)
            after_current = before_current.next_node
            before_current.next_node = this_nod
            this_nod.next_node=after_current
        end
    end

    def remove(index)
        if @head.nil?
            puts "The storage is empty"
        end
        if (index == 0)
            current = @head
            current.next = new_current
            @head = new_current
        end
        if (index > 0)
            current = get_node(index)
            before_current = get_node(index-1)
            after_current = current.next_node
            before_current.next_node = after_current
        end
    end

private

def get_node(index)
    current = @head
    index.times do
        current = current.next_node
    end
    return current 
end






    end


