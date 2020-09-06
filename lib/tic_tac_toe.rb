require 'pry'
class TicTacToe


WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,4,8],
[2,4,6],
[0,3,6],
[1,4,7],
[2,5,8]
]

def initialize
  @board = Array.new(9," ")

end

def display_board
 puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
 puts " ----------- "
 puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
 puts " ----------- "
 puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index (user_input)
  user_input.to_i - 1
end

def move (index,token)
  @board[index] = token
end

def position_taken? (index)
if @board[index] == "X" || @board[index] == "O"
  true
else
  false

end
end

def valid_move? (index)
  if @board[index] == "X" || @board[index] == "O" || !index.between?(0,8)
    false
  else
    true

end
end

def turn_count
@board.count { |index| index == "X" || index == "O"}
end

def current_player
 if turn_count.odd?
   "O"
 else
   "X"
end
end

def turn
  token = current_player
  puts "It's your turn"
  input = gets.strip
  index = input_to_index(input) #Gets input and translates it into index
  if valid_move?(index) == true        #should make the move for index and show that move is valid
    move(index,token)
    display_board          #displays board
   elsif valid_move?(index) == false
  puts "It's your turn"
   input = gets.strip
   index = input_to_index(input)
end
end

def won?
  found_combo = false
 WIN_COMBINATIONS.each do |combo|
   if (position_taken?(combo[0]) && position_taken?(combo[1]) && position_taken?(combo[2])) && (@board[combo[0]] ==  @board[combo[1]] && @board[combo[1]] == @board[combo[2]])
     found_combo = combo 
   end
 end

 found_combo

end

def full?
  if turn_count < 9
    false
  else
    true
end
end

def draw?
  if turn_count == 9 && won? == false
    true
  end
end

def over?
  if draw? == true
    true
  elsif !won?.empty?
    true
  elsif turn_count < 9
    false
  else
    true
  end
end

def winner
if won?
  @board[won?[0]]
end
end


def play
  until over? do
    turn
  end
  end

end
