require_relative "../Matrix"
require_relative "../Queue"

file = File.open("input.txt")
file_data = file.read

data = file_data.split("\n")

matrix1 = Matrix.new(data.length, data[0].length)

data.each_with_index do |row, x|
    row.split('').each_with_index do |number, y|
        matrix1.set_element(x, y, number.to_i)
    end
end

sum = 0

matrix1.each do |x, y, element|
    lowest = true
    if matrix1.get_element(x - 1, y) and matrix1.get_element(x - 1, y) <= element
        lowest = false 
    end
    if matrix1.get_element(x + 1, y) and matrix1.get_element(x + 1, y) <= element
        lowest = false 
    end
    if matrix1.get_element(x, y + 1) and matrix1.get_element(x, y + 1) <= element
        lowest = false 
    end
    if matrix1.get_element(x, y - 1) and matrix1.get_element(x, y - 1) <= element
        lowest = false 
    end
    if lowest
        sum += (element + 1)
    end
end

@matrix = Matrix.new(data.length, data[0].length)

data.each_with_index do |row, y|
    row.split('').each_with_index do |number, x|
        @matrix.set_element(x, y, number.to_i)
    end
end

@count = 0

def flood_fill(x, y)
    @count += 1
    current =  @matrix.get_element(x, y)
    @matrix.set_element(x, y, current.to_s)
    if @matrix.get_element(x - 1, y) and @matrix.get_element(x - 1, y).class != String and @matrix.get_element(x - 1, y) != 9
        flood_fill(x - 1, y)
    end
    if @matrix.get_element(x + 1, y) and @matrix.get_element(x + 1, y).class != String and @matrix.get_element(x + 1, y) != 9
        flood_fill(x + 1, y)
    end
    if @matrix.get_element(x, y + 1) and @matrix.get_element(x, y + 1).class != String and @matrix.get_element(x, y + 1) != 9
        flood_fill(x, y + 1)
    end
    if @matrix.get_element(x, y - 1) and @matrix.get_element(x, y - 1).class != String and @matrix.get_element(x, y - 1) != 9
        flood_fill(x, y - 1)
    end
    return
end

id = 0
basins = {}

@matrix.each do |x, y, element|
    if element.class != String and element != 9
        flood_fill(x, y)
        basins[id] = @count
        id += 1
        @count = 0
    end
end

basins = basins.values.sort

# PART 1

p sum

# PART 2

p basins[-1] * basins[-2] * basins[-3]