require_relative "../../Structs/Stack"

input_data = File.open("input.txt").read.split("\n")

stacks = []

9.times do
    stacks.push(Stack.new())
end

stacks[0].fill(["T", "R", "G", "W", "Q", "M", "F", "P"].reverse)
stacks[1].fill(["R", "F", "H"].reverse)
stacks[2].fill(["D", "S", "H", "G", "V", "R", "Z", "P"].reverse)
stacks[3].fill(["G", "W", "F", "B", "P", "H", "Q"].reverse)
stacks[4].fill(["P", "S", "M", "J", "H"])
stacks[5].fill(["M", "Z", "T", "H", "S", "R", "P", "L"])
stacks[6].fill(["P", "T", "H", "N", "M", "L"])
stacks[7].fill(["F", "D", "Q", "R"])
stacks[8].fill(["D", "S", "C", "N", "L", "P", "H"])

stacks1 = []

9.times do
    stacks1.push(Stack.new())
end

stacks1[0].fill(["T", "R", "G", "W", "Q", "M", "F", "P"].reverse)
stacks1[1].fill(["R", "F", "H"].reverse)
stacks1[2].fill(["D", "S", "H", "G", "V", "R", "Z", "P"].reverse)
stacks1[3].fill(["G", "W", "F", "B", "P", "H", "Q"].reverse)
stacks1[4].fill(["P", "S", "M", "J", "H"])
stacks1[5].fill(["M", "Z", "T", "H", "S", "R", "P", "L"])
stacks1[6].fill(["P", "T", "H", "N", "M", "L"])
stacks1[7].fill(["F", "D", "Q", "R"])
stacks1[8].fill(["D", "S", "C", "N", "L", "P", "H"])


input_data.each do |instruction|
    instruction = instruction.split(" ")
    number_of_items = instruction[1].to_i
    from = instruction[3].to_i - 1
    to = instruction[5].to_i - 1

    number_of_items.times do
        item = stacks[from].pop()
        stacks[to].push(item)
    end
end

input_data.each do |instruction|
    instruction = instruction.split(" ")
    number_of_items = instruction[1].to_i
    from = instruction[3].to_i - 1
    to = instruction[5].to_i - 1

    items = []
    number_of_items.times do
        items.unshift(stacks1[from].pop())
    end

    stacks1[to].fill(items)
end

answer = []

stacks.each do |stack|
    answer.push(stack.pop())
end

answer1 = []

stacks1.each do |stack1|
    answer1.push(stack1.pop())
end

p answer.join("")

p answer1.join("")