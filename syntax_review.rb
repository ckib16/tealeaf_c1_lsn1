#Arrays
array = ["Bob", "Joe", "Fred"] #Create array

array.push("Tom") #add to array - push method
array << "Jerry" #add to array - shovel method

print array[1] #Read array

array[3] = "Jimmy" #Update new value to array position

array.delete("Jimmy") #Delete value
array.delete_at(3) #Delete position

print array
puts "--------------------------"

#Hashes
hash = {age: 41, weight: 169, height: 6.0} #Create hash w/ symbols -new syntax (key: value)
hash_old = {:sign => 'gemini'} #Create has w/ symbols -old syntax (:key => value)

hash[:gender] = "male" #add to hash

puts hash[:weight] #Read hash

hash[:weight] = 172 #Update new value to a key

hash.delete(:height) #Delete key & value

puts hash
puts "--------------------------"


#Iterators - the placeholder is used to hold each iterated value of the array (in this case) so that the logic can be used on it
array.each {|placeholder| puts placeholder}   #single line iterator
puts "--------------------------"
puts

array.each do |storage_variable|              #multiline iterator
  puts storage_variable
  puts "This is a multi-line iterator"
end


puts "--------------------------"
puts

#Methods
def display(argument)       #Method with Argument
  puts argument
  puts "This is a method result"
end

display("Hello")              #Call method and pass in an argument
puts "--------------------------"
puts
