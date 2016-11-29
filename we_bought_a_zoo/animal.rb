class Animal

  attr_reader :name

  def initialize(input=Hash.new)
    @name = input[:name] || "unset"
    @noise = input[:noise] || "unset"
    @trick = input[:trick] || "Doing my Special Trick"
  end

  def make_noise
    puts "#{@name} : #{@noise}"
  end

  def special_trick
    puts "#{@name} starts #{@trick}"
  end

  def entertain
    puts "Oooh, look at this #{animal_type}. It says its name is '#{@name}.'"
    puts "If you push this button, it will make a noise."
    make_noise
    puts "What else can it do?"
    special_trick
  end

  def animal_type
    return self.class.to_s
  end

  def animal_sym
    return animal_type.downcase.to_sym
  end
end