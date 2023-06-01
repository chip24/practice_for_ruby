# class TicTacToe

class Game
  @@turn_count = 1
  @@winner = ''

  def initialize
    puts "Player 1, type your name."
    @player_one_name = gets.chomp
    puts "Player 2, type your name."
    @player_two_name = gets.chomp
    @board = Array.new(3){Array.new(3,"-")}
  end

  def display_board(board)
    puts "#{board[0][0]} | #{board[0][1]} | #{board[0][2]}"
    puts "#{board[1][0]} | #{board[1][1]} | #{board[1][2]}"
    puts "#{board[2][0]} | #{board[2][1]} | #{board[2][2]}"
  end

  def player_turn(turn)
    if turn.odd?
      player_choice(@player_one_name, "O")
    else
      player_choice(@player_two_name, "X")
    end
  end

  def player_choice(player, symbol)
    puts "#{player}, please enter your coordinates separated by a space."
    input = gets.chomp
    input_array = input.split
    coord_one = input_array[0].to_i
    coord_two = input_array[1].to_i

    #loop until the user input is valid (jas a space, is between 0 and 2, and not in an occupied space)
    until input.match(/\s/) && coord_one.between?(0, 2) && coord_two.between?(0, 2) && @board[coord_one][coord_two] == '-'
      puts "Make sure you have input a valid coordinate."
      input = gets.chomp
      input_array = input.split
      coord_one = input_array[0].to_i
      coord_two = input_array[1].to_i
    end

    add_to_board(coord_one, coord_two,symbol)
  end

  def add_to_board(coord_one, coord_two, symbol)
    @board[coord_one][coord_two] = symbol
    @@turn_count += 1
  end

 # check 3 across
  def three_across
    @board.each do |i|
      if i.all? {|j| j =="X"}
        @@winner = 'X'
        @@turn_count = 10
      elsif i.all? {|j| j =="O"}
        @@winner = 'O'
        @@turn_count = 10
      else
        nil
      end
    end
  end

  def three_down
    flat = @board.flatten
    flat.each_with_index do |v, i|
      if v == "X" && flat[i+3]=="X" && flat[i+6] =="X"
        @@winner = "X"
        @@turn_count = 10
      elsif v == "O" && flat[i+3]=="O" && flat[i+6] =="O"
        @@winner = "O"
        @@turn_count = 10
      else
        nil
      end
    end
  end

  def three_diagonal
    center_val = @board[1][1]
    if center_val == "X" || center_val == "O"
      if @board[0][0] && @board[2][2] == center_val
        @@winner = center_val
        @@turn_count = 10
      elsif @board[2][0] && @board[0][2] == center_val
        @@winner = center_val
        @@turn_count = 10
      end
    else
      nil
    end
  end

  def declare_result(symbol)
    case symbol
    when "O"
      puts "#{@player_one_name} has won the game!"
    when "X"
      puts "#{@player_two_name} has won the game!"
    else
      puts "It's a tie!"
    end
  end

  def play_game
    puts "\r\n"
    puts "Here is your empty tic-tac-toe board!"
    puts "\r\n"
    display_board(@board)
    puts "\r\n"

    until @@turn_count >= 10 do
      player_turn(@@turn_count)
      three_across
      three_down
      three_diagonal
      display_board(@board)
    end

    declare_result(@@winner)
  end

end

#instructions
puts "Welcome to tic-tac-toe."
puts "On your turn, enter your coordinates."
puts "\r\n"
puts " 0 0 | 0 1 | 0 2"
puts " 1 0 | 1 1 | 1 2"
puts " 2 0 | 2 1 | 2 2"
puts "\r\n"

# instantiate Game and start play
game = Game.new
game.play_game




