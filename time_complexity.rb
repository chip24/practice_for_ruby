def odd_numbers (max_number)
    current_number = 1

    while current_number < max_number
        if current_number % 2 != 0
            puts current_number
        end

        current_number += 1
    end
    end
    odd_numbers(10)

    def odd_nums(max_number)
        current_number = 1

        while current_number < max_number
            if current_number % 2 != 0
                puts current_number
            end

            current_number += 2
        end
    end

    odd_nums(10)

    def scramble(characters, word)
        word.each_char.all? {|c| characters.count(c) >= word.count(c)}
    end

    puts scramble("ollhe", "hello")

    def scramble_two(characters, word)
        characters = characters.dup 
        word.each_char.all? {|c| characters.sub!(c, "")}
    end

    puts scramble_two("ollhe", "hello")

    def scramble_three(characters, word)
        available = Hash.new(1)
        characters.each_char {|c| available[c] += 1}
        word.each_char.all? {|c| available[c] -= 1;
        available[c] > 0}
        end

        puts scramble_three("ellho", "hello")


