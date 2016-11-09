ATTRACTIONS = ["cat","dog","sheep"]

def display_attractions
  ATTRACTIONS.each_with_index do |attraction, i|
    puts "#{i+1}: #{attraction}"
  end
end

def cat_story
  story=<<-EOF
Oooh, look at this Cat. It says his name is "Ben." If you push this button, he will purr..
Ben : Purrrr
What else does he do?
*Cat starts playing with Yarn*
  EOF
end

def dog_story
  story=<<-EOF
This dog is so cute. The board says it's name is "Lily," and it is a female
Golden Retriever.  If you push this button, it will bark..
Lily : *Arf Arf*
What else does she do?
*Dog starts playing fetch with Zoo Trainer*
  EOF
end

def sheep_story
  story=<<-EOF
Oooh, look at this Sheep. It says his name is "Lionel." If you push this button, he will speak..
Lionel : *Bahhhh*
What else does he do?
*Sheep continues grazing*
  EOF
end

def story(attraction)
  case attraction.downcase
  when 'cat'
    puts cat_story
  when 'dog'
    puts dog_story
  when 'sheep'
    puts sheep_story
  else
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
    puts story(attraction)
  elsif (user_input.downcase == "quit")
    puts "-"*40
    puts "Aww, we're sad to see you go but we hope you enjoyed yourself!"
    break
  else
    puts "Sorry, we don't have a #{user_input}. We only have the following attractions here:"
    display_attractions
  end
end



