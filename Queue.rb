class Queue

    attr_accessor :head, :tail, :length

    class Node
        attr_accessor :next, :value
        def initialize(value)
            @value = value
        end
    end

    def initialize
        @head = nil
        @tail = nil
        @length = 0
    end


    def push(value)
        @length += 1
        if !@tail or !@head
            new_node = Node.new(value)
            @head = new_node
            @tail = new_node
            return
        end
        if @head and !@head.next
            @tail = Node.new(value)
            @head.next = @tail
            return
        end
        @tail.next = Node.new(value)
        @tail = @tail.next
    end

    def pop
        
        return nil if !@head
        @length -= 1
        output = @head
        @head = @head.next
        output.value
    end
end


