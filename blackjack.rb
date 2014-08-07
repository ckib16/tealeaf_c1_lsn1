# Hints:
# 1. Think of the data structure required to keep track of cards in a deck. 
# 2. You'll need to look up and use a "while" loop, since there could be an indeterminate number of "hits" by both the player and dealer. "while" loops are used when we don't have a finite number of iterations.
# 3. Code something. Get started, even if it's just capturing the player's name. Give it an honest attempt before looking at solutions.
# 4. Use methods to extract the piece of functionality that calculates the total, since we need it throughout the program.

# Bonus:
# 1. Save the player's name, and use it throughout the app.
# 2. Ask the player if he wants to play again, rather than just exiting.
# 3. Save not just the card value, but also the suit. 
# 4. Use multiple decks to prevent against card counting players.

# Initialize card deck - mayeb a hash containing arrays? {Hearts = [2..10, J,Q,K,A]}
# Assign values to suit cards
# How to deal with Ace being 1 or 11 (it total with ace > 21 then Ace = 1)
# Deal cards and keep track of which ones are in deck versus on table for player and on table for computer - don't duplicate cards
# Count up the cards and show total value for player
# If hand is 21 = blackjack, no hit
# While hand  < 21 = ask player to hit or stay until >= 21
# If hand > 21 then bust
# If hand < 21 and stay then Switch to computer
# Computer turn: Same as above but computer must hit until at least 17
# If both hands equal then push
# If one player greater without busting then they are winner
# Ask if want to play again

def calculate_total(cards)
  arr = cards.map {|e| e[0]}

  total = 0
  arr.each do |value|
    if value == 'A'
      total += 11
    elsif value.to_i == 0
      total += 10
    else total += value.to_i
    end
  end 

  arr.select {|e| e == 'A'}.count.times do
    if total > 21
      total += 1
    end
  end

  total
end

def player_hit(hand)
  players_hand << deck.pop
  calculate_total(players_hand)
  puts "You now have #{players_hand}"
end

suits = ["Hearts", "Spades", "Diamonds", "Clubs"]
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
deck = cards.product(suits)
deck.shuffle!

puts "Let's play Blackjack!"
puts "What is your name?"
player_name = gets.chomp.to_s

players_hand = []
dealers_hand = []

players_hand << deck.pop
dealers_hand << deck.pop
players_hand << deck.pop
dealers_hand << deck.pop

players_total = calculate_total(players_hand)
dealers_total = calculate_total(dealers_hand)

puts "OK, here's the table..."
puts '-------------'
puts "Dealer has #{dealers_hand} for a total of #{dealers_total}"
puts 
puts 
puts "#{player_name} has #{players_hand} for a total of #{players_total}"
puts '-------------'
puts

#Player's turn
if players_total == 21
  puts "Nice! You hit blackjack. You win."
  exit
end

while players_total < 21
  puts "What do you want to do? 1)Hit 2)Stay?"
  hit_or_stay = gets.chomp

  if !["1","2"].include?(hit_or_stay)
    puts "Sorry, please enter 1 (Hit) or 2 (stay)"
    next
  end

  if hit_or_stay == "2"
    puts "You've chosen to stay."
    break
  end

#hit
  hit_card = deck.pop
  puts "You hit and get the card: #{hit_card}"
  players_hand << hit_card
  players_total = calculate_total(players_hand)
  puts "Your new total is #{players_total}"

  if players_total == 21
    puts "Nice! You hit blackjack. You win."
  elsif players_total > 21
    puts "Oh, snap! Looks like you busted. You lose."
    exit
  end
end

#Dealer turn
if dealers_total == 21
  puts "Dealer hist Blackjack. You lose."
  exit
end

while dealers_total <17
#hit
  hit_card = deck.pop
  puts "Dealer hits and get the card: #{hit_card}"
  dealers_hand << hit_card
  dealers_total = calculate_total(dealers_hand)
  puts "Dealer's new total is #{dealers_total}"

if dealers_total == 21
    puts "Damn! Dealer hit blackjack. You Lose."
  elsif dealers_total > 21
    puts "Dealer busted. You win."
    exit
  end
end

#compare hands
puts 
puts "Dealers cards are:"
dealers_hand.each do |card|
  puts "=> #{card}"
end
puts "Dealers total is #{dealers_total}"
puts ""

puts "Players cards are:"
players_hand.each do |card|
  puts "=> #{card}"
end
puts "Players total is #{players_total}"
puts ""

if players_total > dealers_total
  puts "You win!"
elsif players_total < dealers_total
  puts "You lose."
else
  puts "It's a push, you tie."
end

exit


      







