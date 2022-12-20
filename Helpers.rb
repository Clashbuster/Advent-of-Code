module Aoc_helpers
    def self.string_to_alpha_num_array(string)
        alpha_index = ("a".."z").to_a
        alpha_hash = {}
        alpha_index.each_with_index do |letter, index|
            alpha_hash[letter] = index + 1
        end
        output = string.split("").map do |letter|
            alpha_hash[letter]
        end
    end
end

