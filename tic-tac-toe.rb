puts board = ['1','2','3','4','5','6','7','8','9']

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
 end
 display_board(board)


def input_to_index(user_input)
    user_input.to_i - 1
end

def move(board, index, player)
    board[index] = player
end

def position_taken?(board, index)
    if (board[index] == " ") || (board[index]== "") || (board[index]==nil)
        return false
    else
        return true
    end
end

def valid_move?(board, index)
    if index.between?(0,8) && !position_taken?(board, index)
        return true
    end
end



def turn_count(board)
    counter = 0
    board.each do |spaces|
        if spaces == "X" || spaces == "O"
            counter += 1
        end
    end
    counter
end

def current_player(board)
    turn_count(board) % 2 == 0 ? "X" : "O"
end

def play(board)
    counter = 0
    until counter == 9
        turn(board)
        counter += 1
    end
end

def turn(board)
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(board, index)
        move(board, index, current_player(board))
        turn(board)
    end
    display_board(board)
end

WIN_COMBINATIONS = [
    [0,1,2], 
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
]
def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]

        position_1 == position_2 && position_2 == position_3 && position_taken?(board,win_index_1)
    end
end

def full?(board)
    board.all? {|i| i == "X" || i == "O"}
end

def draw?(board)
    if !won(board) && full?(board)
        return true
    elsif !won?(board) && !full?(board)
        return false
    else won?(board)
        return false
    end
end

def over?(board)
    if draw?(board) || won?(board) || full?(board)
        return true
    end
end

def winner(board)
    if won?(board)
        return board[won?(board)[0]]
    end
end

#turn(board)









