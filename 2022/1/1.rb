# The more Golfy version:
current_bag = 0
bags = []

File.open("input.txt").read.split("\n").each do |item|
    if item === ""
        bags << current_bag
        current_bag = 0
    else
        current_bag += item.to_i
    end
end

bags.sort! {|a, b| b <=> a}

# Part 1
p bags[0]

# PArt 2
p bags[0] + bags[1] + bags[2]