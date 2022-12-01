require_relative "../../Structs/Matrix"
require_relative "../../Structs/List"
require_relative "../../Structs/Queue"
require_relative "../../Structs/Stack"

file = File.open("input.txt")
file_data = file.read

test_file = File.open("test.txt")
test_data = test_file.read

@int_code = file_data.split(",").map(&:to_i)

@int_code[1] = 12
@int_code[2] = 2


one = -> (pos1, pos2, pos3) {
    @int_code[pos3] = @int_code[pos1] + @int_code[pos2]
}

two = -> (pos1, pos2, pos3) {
    @int_code[pos3] = @int_code[pos1] * @int_code[pos2]
}

options = {
    1 => one,
    2 => two,
}

i = 0

while i < @int_code.length - 1

    code = @int_code[i]
    pos1 = @int_code[i+1]
    pos2 = @int_code[i+2]
    pos3 = @int_code[i+3]

    break if code == 99
    options[code].call(pos1, pos2, pos3)

    i += 4
end

p @int_code[0]