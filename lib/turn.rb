def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!
def input_to_index(position)
  position = position.to_i - 1
  return position.to_i
end

def move(board, position, ch = "X")
  board[position] = ch
  return board
end

def valid_move?(board,index)
  if index.between?(0, 8) && !position_taken?(board, index)
    true
  else
    false
  end
end
# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    return true
  elsif board[index] != " " || board[index] != "" || board[index] != nil
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index)
      move(board, index)
      display_board(board)
    else
      puts "invalid input. Please enter 1-9:"
      turn(board)
    end
  end
