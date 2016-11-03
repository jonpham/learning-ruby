# RUBY BLOCKS == {...} || do ... end

def block_method
  puts "This input is used to wrap a block behavior"
  # YIELD indicates an injection point
  yield 6 # Returns 6 to calling block
  puts "Do something else before next block method iteration is done."
  # there can be multiple Injection points
  yield 7 # Returns 7 to calling block
  # NO return ; unless theres a last line variable or a return <object>
end

block_method do # Standard Multi-Line Block Style
  puts "This is the Injected Block Method Code"
end
puts "-"*20

block_method { puts "OneLiner Injection" } # OneLiner Block Style
puts "-"*20

block_method do |item|
  puts "Whatttt number was injected with 'yield' ? : #{item}"
end
puts "-"*20

[ 1, 2, 3 ].each do |array_item|
  puts "You've gotten to the #{ array_item - 1 } index"
end
puts "-"*20

# Alternative to Yield which is more Explicit
def get_name(prompt, &block)
  print prompt + ": "
  name = gets.chomp
  print "Age: "
  age = gets.chomp
  block.call(name,age) # Requires a block passed in.
  name
end

my_name = get_name("Enter Your Name") do |your_name, age|
  puts "That's a cool name, #{your_name}! Age #{age}."
end

puts "my_name : #{my_name}"

# Yield with Block passed in Boolean
def get_name2(prompt, &_block)
  print prompt + ": "
  name = gets.chomp
  print "Age: "
  age = gets.chomp
  yield name,age if block_given?# Requires a block passed in.
  name
end

my_name = get_name2("Enter Your Name") do |your_name, age|
  puts "That's a cool name, #{your_name}! Age #{age}."
end

puts "my_name : #{my_name}"
