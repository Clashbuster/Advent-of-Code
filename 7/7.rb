file = File.open("input.txt")
file_data = file.read

data = file_data.split(',').map(&:to_i)

# PART 1
crabs = {}

data.each do |pos|
    crabs[pos] += 1 if crabs[pos]
    crabs[pos] = 1 if !crabs[pos]
end

data.sort!

min = data[0]
max = data[-1]


least_fuel = "0"
min.upto(max) do |i|
    fuel = 0
    crabs.each do |k, v|
        fuel += ((k - i).abs * v)
    end
    least_fuel = fuel if least_fuel === "0"
    least_fuel = fuel if fuel < least_fuel
end

p("least fuel part 1", least_fuel)

# PART 2

crabs = {}

data.each do |pos|
    crabs[pos] += 1 if crabs[pos]
    crabs[pos] = 1 if !crabs[pos]
end

min = data[0]
max = data[-1]

least_fuel = "0"
min.upto(max) do |i|
    fuel = 0

    crabs.each do |k, v|
        cand = (k - i).abs + 1
        fuel += (((cand * (cand - 1))/2) * v)
    end
    least_fuel = fuel if least_fuel === "0"
    least_fuel = fuel if fuel < least_fuel
end

p("least fuel part 2", least_fuel)







