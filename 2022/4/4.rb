input_data = File.open("input.txt").read.split("\n")

# input_data = File.open("test.txt").read.split("\n")

tally_of_complete_covers = 0
tally_of_any_overlap = 0

input_data.each do |element|
    sections = element.split(/[,,-]+/)
    first_section = sections[0].to_i..sections[1].to_i
    second_section = sections[2].to_i..sections[3].to_i
    if(first_section.cover?(second_section) or second_section.cover?(first_section))
        tally_of_complete_covers += 1
    end

    if(
        first_section.cover?(sections[2].to_i) or
        first_section.cover?(sections[3].to_i) or
        second_section.cover?(sections[0].to_i) or
        second_section.cover?(sections[1].to_i)
    )
        tally_of_any_overlap += 1
    end
end

# Part 1
p tally_of_complete_covers

# Part 2
p tally_of_any_overlap
