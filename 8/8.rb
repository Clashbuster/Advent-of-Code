file = File.open("test.txt")
file_data = file.read

data = file_data.split("\n")

count = 0

values = {
    2 => "gcdfa",
    3 => "fbcad",
    5 => "cdfbe",
    6 => "cdfgeb",
    9 => "cefabd"
}

numbers = []

data.each do |line|
    san = line.split(" | ")[1].split(" ")
    number = []
    san.each do |digit|
        if digit.length == 2
            number.push("1")
            p("digit is 1")
            next
        end
        if digit.length == 3
            number.push("7")
            p("digit is 7")
            next
        end
        if digit.length == 4
            number.push("4")
            p("digit is 4")
            next
        end
        if digit.length == 7
            number.push("8")
            p("digit is 8")
            next
        end
        
    uniq = line.split(" | ")[0].split(" ")
    values = {}
    0.upto(9) do |i|
        values[i] = uniq[i]
    end
        values.each do |k, v|
            p("checking if #{digit} is #{k}")
            all = true
            needs = v.split("")
            needs.each do |need|
                p("#{digit} needs #{need}")
                all = digit.include?(need)
                if !all
                    p("#{digit} is not  #{k}")
                    break
                end
            end
            if all
                p("digit is #{k}")
                number.push(k)
                break
            end
        end
    end
    numbers.push(number.join().to_i)
end

p numbers.inject(:+)