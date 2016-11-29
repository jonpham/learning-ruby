require './animal.rb'

class Dog < Animal
  def initialize(input=Hash.new)
    input[:name] ||= "Fido"
    input[:noise] ||= "*Arf Arf*"
    input[:trick] ||= "playing fetch with Zoo Trainer"
    super(input)
  end
end



