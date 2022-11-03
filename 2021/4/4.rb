file = File.open("input.txt")
file_data = file.read
list = file_data.split("\n")

@random_numbers = list[0].split(',').map(&:to_i)

class BingoCard
    attr_accessor :matrix


    def initialize
        @matrix = []
    end

    def add_row(row)
        @matrix << row
    end

    def score(number)
        card_score = 0;
        @matrix.each_with_index do |e, i|
            e.each_with_index do |e2, i2|
                if e2.class == Integer
                    card_score += e2
                end
            end
        end
        return card_score * number
    end

    def mark(value)
        @matrix.each_with_index do |e, i|
            e.each_with_index do |e2, i2|
                if e2 == value
                    @matrix[i][i2] = e2.to_s
                end
            end
        end
    end

    def x_win?
        @matrix.each do |e|
            found_number = false
                0.upto(4).each do |i|
                    found_number = true if e[i].class == Integer
                end
            if found_number
                next
            else
                return true
            end
        end
    end

    def y_win?
        @matrix[0].each_with_index do |e, i|
            found_number = false
                0.upto(4).each do |i2|
                    if @matrix[i2][i].class == Integer
                        found_number = true 
                    end
                end
            if found_number
                next
            else
                return true
            end
        end
    end

end


test_matrix =  BingoCard.new

test_matrix.add_row([1,2,3,4,5])
test_matrix.add_row([3,5,67,2,3])
test_matrix.add_row([1,2,3,4,5])
test_matrix.add_row([3,5,67,2,3])
test_matrix.add_row([1,2,3,4,5])

test_matrix.mark(3)
test_matrix.mark(1)

@all_matrix = []
current_matrix = BingoCard.new()

list[2..-1].each do |el|
    if el == ""
        @all_matrix.push(current_matrix)
        current_matrix = BingoCard.new()
    else
        parced_row = el.split(" ")
        parced_row.map! do |field|
            field = field.gsub(/\s+/, "")
            field = field.to_i
        end
        current_matrix.add_row(parced_row)
    end
end

def run_game
    @random_numbers.each do |random_number|
        p "called #{random_number}"
        @all_matrix.each_with_index do |matrix, index|
            if matrix.class == BingoCard
                matrix.mark(random_number)
                if matrix.y_win? === true or matrix.x_win? === true
                    p "a matrix has won"
                    @all_matrix[index] = 0
                end
            end
        end
        p @all_matrix
    end
end

run_game()
# I retrieved the data below simply by looking at the logs
# called 20
#<BingoCard:0x000002184faa9128 @matrix=[["85", "64", 44, "39", "57"], ["90", 30, "15", "35", "54"], ["78", "89", "55", 99, "12"], ["80", "96", 20, "50", "45"], [56, "10", "71", "59", 17]]>, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
sum = [44, 30, 99, 56, 17].inject(0, :+)

p sum * 20




