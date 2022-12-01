file = File.open("input.txt")
file_data = file.read

elves_bags = file_data.split("\n").map do |item|
    if item === ""
        item
    else
        item.to_i
    end
end

total_calories_by_elf = {}

elf_id = 0

elves_bags.each do |food_item|
    if food_item === ""
        elf_id += 1
        next
    end

    if total_calories_by_elf[elf_id]
        total_calories_by_elf[elf_id] += food_item
    else
        total_calories_by_elf[elf_id] = food_item
    end
end

sorted_values = total_calories_by_elf.values.sort

first, second, third = sorted_values[-1], sorted_values[-2], sorted_values[-3]

# Part 1
p first

# Part 2
p first + second + third

