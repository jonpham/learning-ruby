require './animal.rb'

class Sheep < Animal
  def initialize(input=Hash.new)
    input[:name] ||= "Sheep"
    input[:noise] ||= "*bah bah*"
    input[:trick] ||= "eating grass."
    super(input)
  end
end