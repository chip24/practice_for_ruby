class Board


   def initialize
      generate_board 
   end

   def generate_board
      @board = Array.new(3){Array.new(3,'-')}
      p @board
   end


   def start_game
      print "IT'S TIME FOR TIC TAC TOE!\n"
      print "Hi, Player 1. Please enter your name."
      p1 = gets.chomp
      print "Hey, Player 2.  Please enter your name."
      p2 = gets.chomp
      puts "OK, #{p1} and #{p2}, let's start the game."
      puts "#{p1}, you will be Xs and #{p2}, you will be Os."
      puts "Let's start!"
   end


#board[0][2] = "X"
#board[0][0] = "X"
#board[0][1] = "X"

   def display_board
      puts ""
      puts " #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} "
      puts "-----------"
      puts " #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} "
      puts "-----------"
      puts " #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} "
      puts ""
   end
end
b = Board.new()
b.generate_board
b.display_board
b.start_game



class Game 
   attr_reader :p1, :p2
   attr_accessor :current_player
    

   def initialize
      @p1 = Players.new{:x}
      @p2 = Player.new{:o}
      @current_player = @p1
   end

   def swap_player
      self.current_player = (current_player == p1 ? p2 : p1) 
   end 
      
   def play 
      puts "It's #{current_player.symbol}'s turn."
   #Prompt current player to enter a space

   #Put the players mark in that space
   end

end

   class Player

      def initialize (symbol)
         @symbol = symbol
      end


end

player1 = Player.new("X")
player2 = Player.new("O")
p player1
p player2




#def full?(arr)
   #new_arr = arr.map {|row| row.map {|col| col == "-"}}
#   new_arr = arr.flatten
 #  p new_arr
  # new_arr.include?("-")
   #puts new_arr.empty?
#end


    
