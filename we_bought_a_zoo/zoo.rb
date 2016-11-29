class Zoo
  attr_reader :attractions, :name

  def initialize(input_hash)
    @name = input_hash[:name] || "Random Zoo"
    @attractions = Hash.new
  end

  def list_attractions
    puts "The #{name} is proud to present the following attractions:"
    attractions.each_with_index do |(key, value), i|
      puts "#{i+1}: #{attractions[key].animal_type}"
    end
  end

  def add_attraction(attraction)
    @attractions.store(attraction.animal_sym, attraction)
  end

  def invite_guest
    puts "Welcome to the #{name}!"
    puts "-"*40
  end

  def entertain_guest
    puts "Where do you want to go? (type '?' to list attractions Or  'quit' to leave the zoo)"
    print "> "
    user_input = gets.chomp.downcase

    if attractions.has_key?(user_input.to_sym)
      attractions[user_input.to_sym].entertain
      return "continue"
    elsif (user_input.downcase == "?")
      list_attractions
      return "continue"
    elsif (user_input.downcase == "quit")
      puts "-"*40
      return "quit"
    else
      puts "Sorry, we don't have a #{user_input}. We only have the following attractions here:"
      list_attractions
      puts attractions[:Dog].inspect
      return "continue"
    end
  end


end
