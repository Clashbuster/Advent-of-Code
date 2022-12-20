require 'set'
require_relative "../../Helpers.rb"

input_data = File.open("input.txt").read.split("\n")

def find_first_char_marker(string)
    # convert each letter in the string to numbers via an alpha-numeric table so they behave nicely with set
    coded_string = Aoc_helpers::string_to_alpha_num_array(string)
    i = 3

    while i < coded_string.length do
        possible_set = []

        3.downto(0) do |set_iteration|
            possible_set.push(coded_string[i - set_iteration].to_i)
        end


        if possible_set.to_set.length == 4
            break
        end
        i += 1
    end

    return i + 1
end

def find_first_message_marker(string)
    coded_string = Aoc_helpers::string_to_alpha_num_array(string)
    
    i = 13

    while i < coded_string.length do
        possible_set = []
  
        13.downto(0) do |set_iteration|
            possible_set.push(coded_string[i - set_iteration].to_i)
        end

        if possible_set.to_set.length == 14
            break
        end
        i += 1
    end

    return i + 1
end

# PART 1
input_data.each do |string|
    p find_first_char_marker(string)
end

# PART 2
input_data.each do |string|
    p find_first_message_marker(string)
end
  

