class Node
    attr_accessor :value, :next
    
    def initialize(value)
        @value = value
        @next = nil
    end
end

class LinkedList
    
    def initialize
        @head = nil
    end

    def append(value)
        new_node = Node.new(value)

        if @head.nil?
            @head = new_node
            return
        end

        current = @head
        current = current.next while current.next
        current.next = new_node
    end

    def prepending(data)
        if @head.nil?
            @head = Node.new(data)
        else
            #this creates a node with value of 4 and a next node of nil
            curr_head = Node.new(data)
            p "curr_head is ..."
            p curr_head
            p "curr_head.next is ..."
            p curr_head.next
            p "@head is ..."
            p @head
            curr_head.next = @head
            p "after equating curr_head.next to @head, @head and curr_head.next are"
            p @head
            p curr_head.next
            @head = curr_head
            p "After equating @head to curr_head,@head and curr_head are"
            p @head
            p curr_head
            
        end
    end

    def delete(value)
        return if @head.nil?

        if @head.value == value
            @head = @head.next
            return
        end

        current = @head
        while current.next && current.next.value != value
            current = current.next
        end

        current.next = current.next.next if current.next
    end

    def to_s
        values = []
        current = @head
        while current
            values << current.value
            current = current.next
        end

        p values.join(' -> ')
    end

    def size 
        counter = 0
        current = @head
        while current
            counter += 1
            current = current.next
        end
        puts counter
    end

    def head
        p @head
        return @head
    end

    def tail
        current = @head
        while current.next != nil
            current = current.next
        end
        p current
        return current
    end

    #figure this out on 7-13
    def pop
        if @head == nil 
            print "List is empty"
            return nil
        end
        if @head.next == nil
            @head = nil
            return
        end

        second_to_last = @head
        while second_to_last.next.next != nil
            second_to_last = second_to_last.next
        end

        second_to_last.next = nil
        return second_to_last
    
end


    def at(index)
        current = @head
        index.times do
            current= current.next
        end
        p current
        #return current
    end

    def contains?(value)
        current = @head

        if @head == nil
            puts "List is empty"
            return
        end

        while current.next != nil
            if current.value == value
                puts "TRUE"
                return true
            end
            current = current.next
        end
        puts "FALSE"
        return false
    end

    # on 7-14 find why this is not working
    def find(value)
        values = []
        current = @head
        puts "The value of @head is #{current.value}"
       # puts "the value of the node after @head is #{current.next.value}"
        #puts "current.value.next.next equals #{current.value.next.next}"

        while current.next != nil
            values << current.value
            current = current.next
        end
        values << current.value
        p values
        if values.include?(value)
            puts "The value #{value} is in the list at index #{values.index(value)}."
            return value
        else
            puts "That value is not in the list."
            return false
        end
    end

    







        
        

end

list = LinkedList.new
list.append(5)
list.append(10)
list.append(15)
list.to_s  
#list.delete(10)
#list.to_s
list.prepending(4)

list.to_s
#list.prepending(1)
#list.to_s
list.size
list.head
list.tail
list.at(3)
#list.pop
#list.to_s
list.contains?(5)
list.contains?(11)
list.find(1)
list.find(4)



