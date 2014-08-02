require 'pry'

#Arrays
array = ["Bob", "Joe", "Fred"] #Create array
print array #put full array
puts

array.push("Tom") #add to array - push method
array << "Jerry" #add to array - shovel method
print array
puts

print array[1] #Read array
puts

array[3] = "Jimmy" #Update new value to array position
print array
puts

array.delete("Jimmy") #Delete value
array.delete_at(3) #Delete position
print array
puts
puts "--------------------------"
puts
binding.pry
#Hashes
hash = {age: 41, weight: 169, height: 6.0} #Create hash with symbols
puts hash

hash[gender: "male"] #add to hash
puts hash

puts hash[:weight] #Read hash

hash[:weight] = 172 #Update new value to a key
puts hash

hash.delete(:height) #Delete key & value
puts hash
puts "--------------------------"
puts

#Iterators
array.each {|placeholder| puts placeholder}   #single line iterator
puts "--------------------------"
puts

array.each do |storage_variable|              #multiline iterator
  puts storage_variable
end
#The placeholder is used to hold each iterated value of the array (in this case) so that the logic can be used on it

puts "--------------------------"
puts

#Methods
def display(argument)       #Method with Argument
  puts argument
  puts "This is a method result"
end

display("Hello")              #Call method and pass an argument
puts "--------------------------"
puts
