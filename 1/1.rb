file = File.open("input.txt")
file_data = file.read
list = file_data.split(' ')
list.map!(&:to_i)

count = 0;
iteration = 0;

previous = 0;

while iteration < list.length

    candadites = list[iteration..iteration + 2]

    if iteration === 0
        previous = candadites.inject(0, :+)
        iteration += 1
        next
    end

    break if candadites.length != 3
    
    # p('previous', previous)
    # p('candadites', candadites)


    if candadites.inject(0, :+) > previous
        count += 1 
    end

    previous = candadites.inject(0, :+)

    iteration += 1
end

p count