require_relative "./Node"

class List

    attr_accessor :head, :tail, :length

    def initialize
        @head = nil
        @tail = nil
        @length = 0
    end

    def bulk_insert(array)
        @length += array.length
        array.each do |element|
            if !@head
                @head = Node.new(element)
                @tail = @head
            else
                new_node = Node.new(element)
                @tail.next = new_node
                @tail = new_node
            end
        end
    end

    def each
        return if !block_given?
        return if !@head or !@tail

        current = @head
        while true
            yield(current)
            break if !current.next
            current = current.next
        end
    end

    def insert(value)
        new_node = Node.new(value)
        if !@head or !@tail
            @head = new_node
            @tail = new_node
            @length += 1
            return
        end
        @tail.next = new_node
        @tail = new_node
        @length += 1
    end

    def concat(list)
        if !@head or !@tail
            @head = list.head
            @tail = list.tail
            return
        end
        if !list.head
            return
        end
        @length += list.length
        @tail.next = list.head
        @tail = list.tail
    end

    def removeAll(value)
        remove_item(@head, value)
    end

    def print_list
        self.print_item(@head)
    end

    private

    def print_item(root)
        return if !root
        p root.value
        print_item(root.next)
    end

    def remove_item(root, value)
        return if !root
        return if !@head or !@tail
        return if !root.next

        if root.value == value
            @head = root.next
            remove_item(@head, value)
        end

        if root.next.value == value
            if !root.next.next
                root.next = nil
                @tail = root
                return
            else
                root.next = root.next.next
                remove_item(root.next, value)
            end
        end
    end
end
