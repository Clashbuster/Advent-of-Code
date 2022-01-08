require_relative "../Matrix"
require_relative "../Queue"

file = File.open("input.txt")
file_data = file.read

data = file_data.split("\n")

matrix = Matrix.new(data.length, data[0].length)

data.each_with_index do |row, x|
    row.split('').each_with_index do |number, y|
        matrix.set_element(x, y, number.to_i)
    end
end

sum = 0

matrix.each do |x, y, element|
    print("checking", element, "\n")
    lowest = true
    p
    if matrix.get_element(x - 1, y) and matrix.get_element(x - 1, y) <= element
        p(element, " is greater than #{matrix.get_element(x - 1, y)}")
        lowest = false 
    end
    if matrix.get_element(x + 1, y) and matrix.get_element(x + 1, y) <= element
        p(element, " is greater than #{matrix.get_element(x + 1, y)}")
        lowest = false 
    end
    if matrix.get_element(x, y + 1) and matrix.get_element(x, y + 1) <= element
        p(element, " is greater than #{matrix.get_element(x, y + 1)}")
        lowest = false 
    end
    if matrix.get_element(x, y - 1) and matrix.get_element(x, y - 1) <= element
        p(element, " is greater than #{matrix.get_element(x, y - 1)}")
        lowest = false 
    end
    if lowest
        print(element, " is the lowest value compared to it's neighbors", "\n")
        sum += (element + 1)
    end
end

p sum