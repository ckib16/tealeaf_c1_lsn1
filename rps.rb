##      Rock-Paper-Scissors Psuedo code
# Show game title and ask player for R/P/S choice
# Get player choice and convert to string, reject non-R/P/S entries
# Display player choice
# Determine computer choice of R/P/S and store in another variable
# Display "You picked #{player_choice} and computer picked {computer_choice}"
# Determine winner or tie
# Display results of you win, computer wins, or tie
# Ask to play again: if No, stop, if yes, start over

require 'pry'

CHOICES = ["R", "P", "S"]

def initialize_hand_choices
  h = {player_hand: nil, computer_hand: nil}
  h
end

def player_decides(hc)
  puts "Chose one: (R/P/S)"
  begin
    players_input = gets.chomp.upcase.to_s
  end until CHOICES.include?(players_input)  # disregard non r/p/s inputs
  hc[:player_hand] = players_input
  puts "You chose #{hc[:player_hand]}"
  hc
  #binding.pry
end

def computer_decides(hc)
  options = ["R", "P", "S"]
  hc[:computer_hand] = options.sample
  puts "The computer chose #{hc[:computer_hand]}"
  hc
  #binding.pry
end

def determine_win_tie(hc)
  if hc[:player_hand] == hc[:computer_hand]
    puts "It's a Tie!"
  elsif hc[:player_hand] == "R" && hc[:computer_hand] == "S" ||  hc[:player_hand] == "S" && hc[:computer_hand] == "P" || hc[:player_hand] == "P" && hc[:computer_hand] == "R"
    display_winning_message(hc[:player_hand])
    puts "You Win!"
  else
    display_winning_message(hc[:computer_hand])
    puts "Aw snap! You lost."
  end
end

def display_winning_message(winning_choice)
  case winning_choice
  when 'R'
    puts 'Rock crushes scissors'
  when 'P'
    puts "Paper covers rock."
  when 'S'
    puts "Scissors cuts paper"
  end
end

loop do
  hand_choices = initialize_hand_choices  #sets variable to initailaized hash result of initialize_hands so we can use in global scope

  puts "Let's Play Rock-Paper-Scissors!"

  player_decides(hand_choices)
  computer_decides(hand_choices)
  determine_win_tie(hand_choices)

  puts "Play again?"
  break if gets.chomp.upcase.to_s != "Y"
end

puts "Goodbye!"
