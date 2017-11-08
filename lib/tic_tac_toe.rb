class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(position, char)
  @board[position] = char
end

def position_taken?(index)
  @board[index] != " " && @board[index] != "" && @board[index] != nil
end

def valid_move?(index)
  !position_taken?(index) && index.between?(0, 8)
end

def turn_count
  counter = 0
  @board.each do |index|
    if index == "X" || index == "O"
      counter+=1
    end
  end
  return counter
end

def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn
  puts "Please enter 1-9:"
  display_board
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
  else
    turn(input)
  end
end

end
