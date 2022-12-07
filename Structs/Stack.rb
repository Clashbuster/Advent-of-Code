require_relative "./Node"

class Stack

    attr_accessor :head, :tail, :length

    def initialize
        @head = nil
        @tail = nil
        @length = 0
    end


    def push(value)
        if !@tail or !@head
            new_node = Node.new(value)
            @head = new_node
            @tail = new_node
            @length += 1
            return
        end
        
        new_node = Node.new(value)
        new_node.next = @tail
        @tail = new_node
        @length += 1
        return
    end

    def pop
        return nil if !@head
        @length -= 1
        output = @tail
        @tail = output.next
        return output.value
    end

    def fill(array)
        if array.class != Array
            raise TypeError.new("method \"fill\" only accepts arrays")
        end
        @length += array.length
        array.each do |el|
            self.push(el)
        end
    end
end


