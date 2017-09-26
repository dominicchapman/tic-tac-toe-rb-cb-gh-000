
WIN_COMBINATIONS = [
  [0, 1, 2], # horizontal top
  [3, 4, 5], # horizontal middle
  [6, 7, 8], # horizontal bottom

  [0, 3, 6], # vertical left
  [1, 4, 7], # vertical middle
  [2, 5, 8], # vertical  right

  [0, 4, 8], # diagonal left
  [2, 4, 6]  # diagonal right
]


# board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "\n-----------\n"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "\n-----------\n"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# for player, board contains spaces 1-9, but array is 0-8
def input_to_index(input)
  # input is string; we convert to integer
  input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

# if the position is free, the method should return false
# so if position is not free, return true
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# move is present on board && not already filled
# returns true if the move is valid
def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end
