
file_data = File.open("input.txt").read.gsub(/[ABCXYZ]/, 'A' => 1, 'B' => 2, 'C' => 3, 'X' => 1, 'Y' => 2, 'Z' => 3).split("\n").map do |item|
    item.split(" ").map(&:to_i)
end

# id:
# rock: 1
# paper: 2
# scissors: 3

# points:
# rock: 1
# paper: 2
# scissors: 3

# lose: 0
# draw: 3
# win: 6

outcomes = {
    1 => -> (opponent) {
        if (opponent === 2)
            return 1
        elsif (opponent === 3)
            return 7
        else
            return 4
        end
    },
    2 => -> (opponent) {
        if (opponent === 3)
            return 2
        elsif (opponent === 1)
            return 8
        else
            return 5
        end
    },
    3 => -> (opponent) {
        if (opponent === 1)
            return 3
        elsif (opponent === 2)
            return 9
        else
            return 6
        end
    },

}

points = 0

file_data.each do |match|
    points += outcomes[match[1]].call(match[0])
end

file_data1 = File.open("input.txt").read.split("\n").map do |item|
    item.split(" ")
end

outcomes = {
    "A" => -> (outcome) {
        if (outcome === "X")
            return 3
        elsif (outcome === "Y")
            return 4
        else
            return 8
        end
    },
    "B" => -> (outcome) {
        if (outcome === "X")
            return 1
        elsif (outcome === "Y")
            return 5
        else
            return 9
        end
    },
    "C" => -> (outcome) {
        if (outcome === "X")
            return 2
        elsif (outcome === "Y")
            return 6
        else
            return 7
        end
    }
}

points1 = 0

file_data1.each do |match|
    points1 += outcomes[match[0]].call(match[1])
end

# Part 1:
p points

# Part 2:
p points1

