file = File.open("input.txt")
file_data = file.read
list = file_data.split("\n")

# PART 1

# depth = 0
# horz = 0
# iter = 0


# decision_tree = {
#     "forward" => lambda { |number|
#         horz += number
#     },
#     "up" => lambda { |number|
#         depth -= number
#     },
#     "down" => lambda { |number|
#         depth += number
#     }
# }



# while iter < list.length

#     item = list[iter]
#     command = item.split(' ').first
#     modify = item.split(' ').last.to_i

#     decision_tree[item.split(' ').first].call(modify)

#     iter +=1
# end

# p depth * horz

# PART 2

depth = 0
horz = 0
iter = 0
aim = 0


decision_tree = {
    "forward" => lambda { |number|
        horz += number
        depth += (number * aim)
    },
    "up" => lambda { |number|
        aim -= number
    },
    "down" => lambda { |number|
        aim += number
    }
}



while iter < list.length

    item = list[iter]
    command = item.split(' ').first
    modify = item.split(' ').last.to_i

    decision_tree[item.split(' ').first].call(modify)

    iter +=1
end

p depth * horz


