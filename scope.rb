#1 Create a local variable and modify it at an inner scope. You can try

#a) re-assigning the variable to something else
#b) call a method that doesn’t mutate the caller
#c) call a method that mutates the caller.
#2 Create a local variable at an inner scope and try to reference it in the outer scope. What happens when you have nested do/end blocks?

local_var = 4

3.times do |n|
  local_var = 7
  inner_var = 9
  puts local_var
end

def some_method
  local_var = 1   #method variables are not seen by normal execution flow, totally separate
end

puts "_____after block"
puts local_var
puts inner_var  #error because inner_var is initiated inside a block, can't be used outside of that scope
