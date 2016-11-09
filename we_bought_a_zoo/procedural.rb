ATTRACTIONS = ["cat","dog","sheep"]

def display_attractions
  ATTRACTIONS.each_with_index do |attraction, i|
    puts "#{i+1}: #{attraction}"
  end
end

puts "Welcome to the Zoo!"
puts "-"*40

user_input  = ""
while true 
  puts "Where do you want to go? (Or type 'quit' to leave the zoo)"
  user_input = gets.chomp
  if ATTRACTIONS.include?(user_input.downcase)
    attraction = user_input
    puts "Ok, we're going to see the #{attraction}!\n"
    puts "Wow, look at that #{attraction}. It's it beautiful?\n"
  elsif (user_input.downcase == "quit")
    puts "-"*40
    puts "Aww, we're sad to see you go but we hope you enjoyed yourself!"
    break
  else
    puts "Sorry, we don't have that #{attraction}. We only have the following attractions here:"
    display_attractions
  end

  puts "Alright, so where to?"
end



