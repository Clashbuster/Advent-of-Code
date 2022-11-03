require_relative "../Stack"

file = File.open("input.txt")
file_data = file.read

data = file_data.split("\n")

points = {
    ")" => 3,
    "]" => 57,
    "}" => 1197,
    ">" => 25137
}

points2 = {
    ")" => 1,
    "]" => 2,
    "}" => 3,
    ">" => 4
}

chars = {
    "(" => ")",
    "[" => "]",
    "{" => "}",
    "<" => ">"
}

opens = chars.keys()
closes = points.keys()
sum = 0
line_scores = []

data.each_with_index do |row, index|
    stack = Stack.new()
    corrupted = false
    row.split("").each do |char|
        if opens.include? char
            stack.push(char)
        end
        if closes.include? char
            candadite = stack.pop()
            if char != chars[candadite]
                sum += points[char]
                corrupted = true
                break
            end
        end
    end
    if !corrupted
        sum2 = 0
        while stack.length() > 0
            sum2 = sum2 * 5
            candadite = stack.pop()
            sum2 += points2[chars[candadite]]
        end
        line_scores.push(sum2)
    end
end

print("part 1: #{sum}", "\n")
print("part 2: #{line_scores.sort[(line_scores.length / 2)]}", "\n")



