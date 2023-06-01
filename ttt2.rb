# TicTacToe

class Game
    @@turn_count = 1
    @@winner = ''
  
    def initialize
      puts "Player 1, type your name."
      @player_one_name = gets.chomp
      puts "Player 2, type your name."
      @player_two_name = gets.chomp
      @board = ['1','2','3','4','5','6','7','8','9']
 
    end
  
    def display_board(board)
      puts "#{board[0]} | #{board[1]} | #{board[2]}"
      puts "----------"
      puts "#{board[3]} | #{board[4]} | #{board[5]}"
      puts "----------"
      puts "#{board[6]} | #{board[7]} | #{board[8]}"
    end
  
    def player_turn(turn)
      if turn.odd?
        player_choice(@player_one_name, "O")
      else
        player_choice(@player_two_name, "X")
      end
    end
  
    def player_choice(player, symbol)
      puts "#{player}, please enter the number of your space."
      input = gets.chomp
      input_index = input.to_i - 1
      
      #loop until the user input is valid (i.e. it is a number between 0 and 8 and is not in an occupied space)
      until input_index.between?(0, 8) && @board[input_index] != "X" && @board[input_index] != "O"
        puts "Make sure you have input a valid coordinate."
        input = gets.chomp
        input_index = input.to_i - 1
      end
  
      add_to_board(input_index,symbol)
    end
  
    def add_to_board(input_index, symbol)
      @board[input_index] = symbol
      @@turn_count += 1
    end


    WIN_COMBINATIONS = [ 
    [0,1,2], # top_row 
    [3,4,5], # middle_row 
    [6,7,8], # bottom_row 
    [0,3,6], # left_column 
    [1,4,7], # center_column 
    [2,5,8], # right_column 
    [0,4,8], # left_diagonal 
    [6,4,2] # right_diagonal 
    ]   

    def win(board)
      WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
        
        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]
        

        if position_1 == position_2 && position_2 == position_3 && position_1 == "X"
          @@winner = "X"
          @@turn_count = 10
        elsif position_1 == position_2 && position_2 == position_3 && position_1 == "O"
          @@winner = "O"
          @@turn_count = 10
        else
          nil
        end
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
        win(@board)
        display_board(@board)
      end
  
      declare_result(@@winner)
    end
  
  end
  
  #instructions
  puts "Welcome to tic-tac-toe."
  puts "On your turn, enter the space you'd like your symbol in."
  puts "\r\n"
  puts " 1 | 2 | 3"
  puts "----------"
  puts " 4 | 5 | 6"
  puts "----------"
  puts " 7 | 8 | 9"
  puts "\r\n"
  
  # instantiate Game and start play
  game = Game.new
  game.play_game
  
  
  
  
  