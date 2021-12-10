file = File.open("input.txt")
file_data = file.read
list = file_data.split("\n")

# PART 1
# gamma = []
# epsilon = []

# hash = {
#     "1" => 0,
#     "0" => 0
# }

# index = 0

# while true
#     list.each do |el|
#         item = el.split('')
#         hash[item[index]] += 1
#     end
#     if hash['1'] > hash['0']
#         gamma.push('1')
#         epsilon.push('0')
#     else 
#         gamma.push('0')
#         epsilon.push('1')
#     end
#     hash = {
#     "1" => 0,
#     "0" => 0
#     }
#     index += 1
#     if index > list[0].length - 1
#         break
#     end
# end

# p gamma.join().to_i(2)
# p epsilon.join().to_i(2)
# p gamma.join().to_i(2) * epsilon.join().to_i(2)

# PART 2

oxy = 0;
co2 = 0;

def filter_oxy(index, a_list)
    if index > 11
        return a_list
    end
    return a_list if a_list.length === 1

    a_hash = {
        "1" => [],
        "0" => []
    }

    a_list.each do |el|
        item = el.split('')
        a_hash[item[index]].push(el)
    end
    if a_hash['0'].length > a_hash['1'].length
        filter_oxy(index + 1, a_hash['0'])
    else
        filter_oxy(index + 1, a_hash['1'])
    end
end

def filter_co2(index, a_list)
    if index > 11
        return a_list
    end
    return a_list if a_list.length === 1

    a_hash = {
        "1" => [],
        "0" => []
    }

    a_list.each do |el|
        item = el.split('')
        a_hash[item[index]].push(el)
    end
    
    if a_hash['0'].length <= a_hash['1'].length
        filter_co2(index + 1, a_hash['0'])
    else
        filter_co2(index + 1, a_hash['1'])
    end
end

co2 = filter_co2(0, list)
oxy = filter_oxy(0, list)

p oxy.join().to_i(2) * co2.join().to_i(2)




