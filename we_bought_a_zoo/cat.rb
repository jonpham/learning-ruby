require './animal.rb'

class Cat < Animal
  def initialize(input=Hash.new)
    input[:name] ||= "Garfield"
    input[:noise] ||= "*meow meow*"
    input[:trick] ||= "playing with Yarn."
    super(input)
  end
end