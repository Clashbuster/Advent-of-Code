input_data = File.open("input.txt").read.split("\n")

# input_data = File.open("test.txt").read.split("\n")


letter_list = ("a".."z").to_a
letter_list.concat(("A".."Z").to_a)

priorities = {}

letter_list.each_with_index do |e,i|
    priorities[e] = i + 1
end

sum_of_priorities = 0

input_data.each do |rucksack|
    rucksack = rucksack.split("")
    left, right = rucksack.each_slice( (rucksack.size/2.0).round ).to_a
    right = right.join("")

    left.each do |letter|
        if(right.match(/#{letter}/))
            sum_of_priorities += priorities[letter]
            break
        end
    end
end

# Part 1
p sum_of_priorities


