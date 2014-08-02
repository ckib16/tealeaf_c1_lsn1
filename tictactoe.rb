#Psuedo code
#Draw a playing field
# Get input from the player for an X to go in spaces #1-9
# Store input in a Hash with spaces #1-9 and either X or O???
# Map puts lines to each section of chart?
# Place X in space input by player
# Place O in a space not yet used by player
# Keep past choices displayed and ask user for another input (????)
# Keep going until player or computer has 3 marks in a row (Payer/Computer wins)
# OR board is filled (Tie)

require 'pry'

def initialize_board
  b = {}
  (1..9).each {|position| b[position] = ''}
  b                                             #'explicit return value' beacuase .each returns the orinal object (trange 1..(, not the hash we want
end

def draw_board(b) #can use the hash created in method above if passed in as an argument
  system 'clear' 
  puts " #{b[1]} | #{b[2]} | #{b[3]} "
  puts "---------"
  puts " #{b[4]} | #{b[5]} | #{b[6]} "
  puts "---------"
  puts " #{b[7]} | #{b[8]} | #{b[9]} "
end

#select from hash 'b' the key/value pairs where v = empty, then give me its key
def empty_positions(b)
  b.select {|k, v| v == ' ' }.keys
end

def player_select(b)
  puts "Please select a space #1-9"
  position = gets.chomp.to_i
  b[position] = 'X'
end

def computer_select(b)
  position = empty_positions(b).sample
  b[position] = 'O'
end

def check_winner(b)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    if b[line[0]] == 'X' and b[line[1]] == 'X' and b[line[2]] =='X'
      return 'Player'
    elsif b[line[0]] == 'O' and b[line[1]] == 'O' and b[line[2]] =='O'
      return 'Computer'
    else
      return nil
    end
  end
end

board = initialize_board #board = return value of initialize_board, which is hash 'b'
draw_board(board) #invoke drawboard and pass in the value of 'board' (which is hash 'b')

begin
  player_select(board)
  computer_select(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || empty_positions(board).empty?
binding.pry
if winner
  puts "#{winner} Wins!"
else
  puts "It's a tie!"
end

