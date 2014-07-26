#pass_by_reference.rb

array = [1,2,3,3,3,4]

def non_mutate (placeholder)
  placeholder.uniq
  puts placeholder
end

def mutate (placeholder)
  placeholder.uniq!
  puts placeholder
end

non_mutate(array)

puts "-------"

mutate(array)
