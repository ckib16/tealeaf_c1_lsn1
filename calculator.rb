require 'pry'

puts "What's your first number?"
first = gets.chomp.to_i

puts "...and the second number?"
second = gets.chomp.to_i
# binding.pry
puts "What do you want to do?"
puts "You can (1)Add; (2)Subtract; (3) Multiply; (4)Divide?"

function = gets.chomp.to_i

if function == 1
  puts "Your sum is #{first + second}"
elsif function == 2
  puts "Your result is #{first - second}"
elsif function == 3
  puts "Your product is #{first * second}"
elsif function == 4
  puts "Your division answer is #{first.to_f / second.to_f}"
end

    
    
    