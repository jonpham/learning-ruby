# Program : Guessing a Number

def guess_a_number()
  puts "I'm thinking of a number between 0-100, Tell me what you think it\nis & I'll tell you if you are right!"
  puts "Your Guess : "
  guess = gets.chomp.to_i
  if (guess == 75 && guess > 0 && guess < 100 )
    puts "You got the Right Answer!"
  else
    puts "Sorry, better Luck Next time..."
  end
end

# guessANumber

def fortune_cookie()
  puts "I am a famous fortune teller! Tell me your favorite \ninteger, and I'll tell you a fortune!"
  puts "Favorite Number : "
  guess = gets.chomp.to_i
  if ( 0 < guess && guess < 75 )
    puts "Something Good is Coming your Way!"
  elsif ( guess >= 75 )
    puts "It's going to rain tomorrow."
  else
    puts "Better get your affairs in order."
  end
end

fortune_cookie

# Conditional Assignment Operator

my_name ||= "Jonathan"
# Sets my_name to "Jonathan" if my_name was previously unset.
my_name = (my_name || "Jonathan")


# Unusual keywords 
flag = false
unless flag != false
  puts "Flag is still true"
end
