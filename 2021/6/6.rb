file = File.open("input.txt")
file_data = file.read

data = file_data.split(',').map(&:to_i)

@fish = {}

data.each do |el|
    @fish[el] += 1 if @fish[el]
    @fish[el] = 1 if !@fish[el]
end

def simulate_fish(number)
    i = 0
    new_fish = 0

    while i < number
        new_count = {8 => new_fish}
        new_fish = 0
        
        @fish.each do |k, v|
            new_count[k - 1] = v
        end

        if new_count[0]
            new_fish = new_count[0]
        end
        if new_count[-1]
            new_count[6] += new_count[-1] if new_count[6]
            new_count[6] = new_count[-1] if !new_count[6]
            new_count.delete(-1)
        end
        @fish = new_count
        i += 1
    end

    total = 0

    @fish.each do |k, v|
        total += v
    end

    return total
end

# PART 1
# p simulate_fish(80)

# PART 2
p simulate_fish(256)









