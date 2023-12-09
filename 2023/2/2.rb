input = File.open("input.txt").read
test_input = File.open("test.txt").read

input = input.split("\n")

def part_1(input)
    all_games ={
        # [game_id] => game_data
    }

    input.each do |game|
        # parse the string into the fundamental data
        game = game.split(":")
        game[0] = game[0].gsub("Game ", "")
        game[1] = game[1].split(";")
        game[1] = game[1].map do |draw|
            draw = draw.split(",")
        end
        game[1].flatten!


        # Collect the data into this metadata object
        game_metadata =  {
            "red" => 0,
            "green" => 0,
            "blue" => 0
        }

        # Fill the metadata object with the data
        game[1].each do |cube_count|
            cube_count.strip!
            cube_count = cube_count.split(" ")
            if cube_count[0].to_i > game_metadata[cube_count[1]]
            game_metadata[cube_count[1]] = cube_count[0].to_i
            end
        end

        # Put the metadata object in the top level data structure
        all_games[game[0].to_i] = game_metadata
    end


    red_limit = 12
    green_limit = 13
    blue_limit = 14

    sum = 0

    all_games.each do |key, value|
        next if value["green"] > green_limit
        next if value["red"] > red_limit
        next if value["blue"] > blue_limit
        sum += key
    end

    # PART 1
    p sum
end


def part_2(input)
    all_games ={
        # [game_id] => game_data
    }

    # Split the combined input into seperate lines
    

    input.each do |game|
        # parse the string into the fundamental data
        game = game.split(":")
        game[0] = game[0].gsub("Game ", "")
        game[1] = game[1].split(";")
        game[1] = game[1].map do |draw|
            draw = draw.split(",")
        end
        game[1].flatten!


        # Collect the data into this metadata object
        game_metadata =  {
        }

        # Fill the metadata object with the data I care about
        game[1].each do |cube_count|
            cube_count.strip!
            cube_count = cube_count.split(" ")
            if !game_metadata[cube_count[1]]
                game_metadata[cube_count[1]] = cube_count[0].to_i
            end
            if cube_count[0].to_i > game_metadata[cube_count[1]]
                game_metadata[cube_count[1]] = cube_count[0].to_i
            end
        end

        # Put the metadata object in the top level data structure
        all_games[game[0].to_i] = game_metadata
    end


    red_limit = 12
    green_limit = 13
    blue_limit = 14

    sum = 0

    all_games.each do |key, value|
        power = value["red"] * value["green"] * value["blue"]
        sum += power
    end

    # p all_games


    # # PART 2
    p sum
end

part_1(input)

part_2(input)

