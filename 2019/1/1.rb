require_relative "../../Structs/Matrix"
require_relative "../../Structs/List"
require_relative "../../Structs/Queue"
require_relative "../../Structs/Stack"


file = File.open("input.txt")
file_data = file.read

modules = file_data.split("\n").map(&:to_i)


# Outputs
@sum1 = 0
@sum2 = 0

# Calculate fuel given a number
def calculate_fuel(number)
    return number.div(3) - 2
end

# Recursively calculate fuel given a number
def recursively_calculate_fuel(number)

    fuel = calculate_fuel(number)
    return if fuel <= 0 

    @sum2 += fuel
    return recursively_calculate_fuel(fuel)

end

# Part 1 iteration
modules.each do |mod|
    @sum1 += calculate_fuel(mod)
end

# Part 2 iteration
modules.each do |mod|
    recursively_calculate_fuel(mod)
end

# Part 1 Answer
p @sum1

# Part 2 Answer
p @sum2