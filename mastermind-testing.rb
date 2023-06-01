

def player_guess(player)
    puts "#{player}, please enter your guess of four colors with a space between each."
    input = gets.chomp
    input_array = input.split
    puts input_array
    p input_array
    color_one = input_array[0]
    color_two = input_array[1]
    color_three = input_array[2]
    color_four = input_array[3]
    puts color_one
    puts color_two
    puts color_three
    puts color_four

    until input.count("^roygbp ") == 0 && input_array.count == 4
        puts "Make sure you entered a valid list of four colors including only r, o, y, g, b, and, p with a space between each color."

        input = gets.chomp
        input_array = input.split
        puts input_array
        p input_array
        color_one = input_array[0]
        color_two = input_array[1]
        color_three = input_array[2]
        color_four = input_array[3]
        p color_one
        p color_two
        p color_three
        p color_four
    end
  end

player_guess("Chip")