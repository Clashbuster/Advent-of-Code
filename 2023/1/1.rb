require_relative "../../Structs/Matrix"
require_relative "../../Structs/List"
require_relative "../../Structs/Queue"
require_relative "../../Structs/Stack"

test2 = File.open("test2.txt").read
test1 = File.open("test.txt").read
input = File.open("input.txt").read

input1 = input.split("\n").map(&:clone)
input2 = input.split("\n").map(&:clone)
# input2 = test2.split("\n").map(&:clone)

sum1 = 0

input1 = input1.map do |string|
    string = string.scan(/[\d]/).join('');

    sum1 += [string[0], string[-1]].join("").to_i
end

number_chart = {
    "one" => '1',
    "two" => '2',
    "three" => '3',
    "four" => '4',
    "five" => '5',
    "six" => '6',
    "seven" => '7',
    "eight" => '8',
    "nine" => '9',
}

sum2 = 0

input2 = input2.each do |string|
    string = string.scan(/(?=(\d|zero|one|two|three|four|five|six|seven|eight|nine))/).flatten.map! do |found_number|
        if (found_number.match(/[\d]/))
            found_number = found_number
        else
            found_number = number_chart[found_number]
        end
    end

    string = string.join('')
    number = [string[0], string[-1]].join("").to_i
    sum2 += number
end

# PART 1

p "PART 1: ", sum1

# PART 2

p "PART 2: ", sum2
