# Shows Loops

# Loop Keyword

def loopy()
  loop do
    print "Do you want to continue (y/n)?"
    answer =  gets.chomp.downcase
    if (answer == "n")
      break # Break out of Loop
    end # End If for User Designated Break
  end # End Loop
end

def whiles()
  break_sentinel = "n"
  answer = ""

  while (answer != break_sentinel) do # Condition to Break
    # Do something
    print "Do you want to continue (y/n)?"
    answer =  gets.chomp.downcase
  end

end

def untils()
  break_sentinel = "n"
  answer = ""

  until (answer == break_sentinel) do
    # Do something
    print "Do you want to continue (y/n)?"
    answer =  gets.chomp.downcase
  end

end

def modifier_loops()
  break_sentinel = "n"
  answer = ""

  #`while` modifier
  begin
    # Do something
    print "Do you want to continue (y/n)?"
    answer =  gets.chomp.downcase
  end while (answer != break_sentinel)

  #Until Modifier
  begin
    # Do something
    print "Do you want to continue (y/n)?"
    answer =  gets.chomp.downcase
  end until (answer == break_sentinel)

end

def fors()
  # for variable [, variable ...] in expression [do]
  #  code
  # end

  for i in 0...10
    puts "Value of local varibale is #{i}"
  end
end

string_example = "Hellow"
string_example.split

def foreach()
  # (expression).each do |variable[, variable...]| code end
  (0...5).each do |i|
    puts "Value of local varibale is #{i}"
  end
end

def num_times()
  # <number>.times do ... end
  num_times = 6
  num_times.times do |i|
    puts "this is the #{i} time."
  end
end
