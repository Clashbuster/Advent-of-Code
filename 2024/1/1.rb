require_relative "../../Structs/Matrix"
require_relative "../../Structs/List"
require_relative "../../Structs/Queue"
require_relative "../../Structs/Stack"


input = File.open("input.txt").read.split("\n")
testInput = File.open("test.txt").read.split("\n")


def part1(input)
    firstList = [];
    secondList = [];
    total = 0;

    input.each do |line|
        firstList.push(line.split("   ").first)
        secondList.push(line.split("   ").last)
    end

    firstList.sort!
    secondList.sort!

    firstList.each_with_index do |id, index|
        total += (id.to_i - secondList[index].to_i).abs()
    end

    return total
end

def part2(input)
    appearances = {}
    firstList = [];
    secondList = [];
    total = 0;

    input.each do |line|
        firstList.push(line.split("   ").first.to_i)

        secondNumber = line.split("   ").last.to_i
        
        if (appearances[secondNumber])
            appearances[secondNumber] += 1
        else
            appearances[secondNumber] = 1
        end
    end

    firstList.each do |id|
        if(appearances[id])
            total += id * appearances[id]
        end
    end

    return total
end


p part1(input);
p part2(input)