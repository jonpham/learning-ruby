require './zoo.rb'
require './dog.rb'
require './cat.rb'
require './sheep.rb'

zoo = Zoo.new("Barnum and Baileys!")
zoo.add_attraction(Dog.new)
zoo.add_attraction(Cat.new)
zoo.add_attraction(Sheep.new)

zoo.invite_guest
zoo.entertain_guest