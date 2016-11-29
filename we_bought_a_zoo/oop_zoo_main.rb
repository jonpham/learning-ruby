require './zoo.rb'
require './dog.rb'
require './cat.rb'
require './sheep.rb'

zoo = Zoo.new({name:"Barnum and Baileys!"})
zoo.add_attraction(Dog.new({name:"Fido",noise:"*Arf Arf*",trick:"*playing fetch with Zoo Trainer*"}))
zoo.add_attraction(Cat.new())
zoo.add_attraction(Sheep.new())

zoo.invite_guest
ret_value = ""
while ret_value != "quit"
  ret_value = zoo.entertain_guest
end

