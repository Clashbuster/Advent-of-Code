require "set"
file = File.open("input.txt")
input = file.readlines.map(&:chomp).map {|x| x.chars.map(&:to_i)}
file.close
def adj(input, x, y)
out = []
if y > 0
out.append([x, y - 1])
end
if y < input.length - 1
out.append([x, y + 1])
end
if x > 0
out.append([x - 1, y])
end
if x < input[y].length - 1
out.append([x + 1, y])
end
out
end
basin_sizes = []
risk = 0
input.each_with_index do |row, y|
row.each_with_index do |val, x|
top = y > 0 ? input[y - 1][x] : 99
bot = y < input.length - 1 ? input[y + 1][x] : 99
left = x > 0 ? input[y][x - 1] : 99
right = x < input[y].length - 1 ? input[y][x + 1] : 99
if val < top && val < bot && val < left && val < right
risk += val + 1
# part 2
basin = Set[[x, y]]
maybe_basin = adj(input, x, y)
while maybe_basin.any?
more = []
maybe_basin.each do |pos|
if input[pos[1]][pos[0]] < 9 && !basin.include?(pos)
basin.add(pos)
adj(input, pos[0], pos[1]).each do |zz|
more.append(zz)
end
end
end
maybe_basin = more
end
basin_sizes.append(basin.length)
end
end
end
# part 1
pp risk
# part 2
sorted = basin_sizes.sort.reverse
pp sorted[0] * sorted[1] * sorted[2]