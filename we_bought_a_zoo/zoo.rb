class Zoo
  attr_reader :attractions, :guests, :name

  def initialize(input_hash)
    @name = input_hash[:name] || "Random Zoo"
    @attractions = Hash.new
    @guests = []
  end

  def list_attractions
    puts "The #{name} is proud to present the following attractions:"
    attractions.each_with_index do |attraction, i|
      puts "#{i+1}: #{attraction}"
    end
  end

  def make_announcement(announcement)
    puts "-"*40
    puts "Attention Guests: the #{name} would like to make the following announcement."
    puts announcement
    puts "-"*40
  end

  def add_guest(guest)
    @guests << guest
  end

  def add_attraction(attraction)
    @attractions.store(attraction.class.to_sym, attraction)
  end

  def invite_guest
    puts "Welcome to the #{name}!"
    puts "-"*40
  end

  def entertain_guest
    puts "Where do you want to go? (Or type 'quit' to leave the zoo)"
    p "> "
    user_input = gets.chomp.downcase
    if attractions.has_key?(user_input.to_sym)
      attractions[user_input.to_sym].entertain
    elsif (user_input.downcase == "quit")
      puts "-"*40
      puts "Aww, we're sad to see you go but we hope you enjoyed yourself!"
      break
    else
      puts "Sorry, we don't have a #{user_input}. We only have the following attractions here:"
      list_attractions
    end
  end


end
