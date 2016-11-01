# This File outlines references uses for Class Creation in Ruby

# All Ruby Objects inherit the 'Object' Class
# It provides a number of base methods.

# [  :!, :!=, :!~, :<=>, :==, :===, :=~, :__id__, :__send__,
#    :class, :clone, :define_singleton_method, :display,
#    :dup, :enum_for, :eql?, :equal?, :extend, :freeze,
#    :frozen?, :hash, :inspect, :instance_eval, :instance_exec,
#    :instance_of?, :instance_variable_defined?, :instance_variable_get,
#    :instance_variable_set, :instance_variables, :is_a?, :itself,
#    :kind_of?, :method, :methods, :nil?, :object_id, :private_methods,
#    :protected_methods, :public_method, :public_methods, :public_send,
#    :remove_instance_variable, :respond_to?, :send, :singleton_class,
#    :singleton_method, :singleton_methods, :taint, :tainted?, :tap,
#    :to_enum, :to_s, :trust, :untaint, :untrust, :untrusted?
#  ]

# STRING OBJECT EXAMPLE
string = String.new("New String")
string.methods() # returns an Array
string.respond_to?("upcase") # Returns a bool
string.class()
string.inspect()

class ClassName
  # STANDARD CONSTRUCTOR METHOD
  def initialize()
    # Constructor Behavior
    puts "You've created a new ClassName object."
  end

  # Local Variables
end

class Car < ClassName
  # CREATE PUBLIC GETTERS on ONE LINE using the ATTR_READER syntax
  attr_reader :name
  # CREATE PUBLIC SETTERS on ONE LINE  USING the attr_writer syntax
  attr_writer :style
  # CREATE PUBLIC GETTERS/SETTERS combo using attr_accessor
  attr_accessor :model, :maker

  # Local Attributes (Variables)
  def initialize(name)
    # Runs SuperClass's Overrided method of same name.
    super()
    @name = name
    @model = "focus"
    @maker = "ford"
    puts "You've created a new Car object named #{@name}."
  end

end

# Structs are simple Classes which have accessors and minimal methods.

StructClass = Struct.new(:member_1, :member_2) do 
  # Create Simple methods
  def output_members
    puts "#{member_1} & #{member_2}"
  end
end

#!!!equivalent!!!
class StructClass
  attr_accessor :member_1, :member_2

  def initialize(value1,value2)
    @member_1, @member_2 = value1, value2
  end
end

# Instantiate as foolows

struct = StructClass.new("first_name","last_name")
# Structs automatically include the Enumerator module, which loops through its attributes.
struct.each_pair do |key, value|
  puts "#{key} == #{value}" #Output each member's value to the console
end


### SETTER GETTER EXPANSION
##########################################
class Item
  # Expands to Setter and Getter
  attr_accessor :name , :description

  # Expands to just Getters
  attr_reader :name, :description
end

class Item
  # Setters
  def name 
    @name
  end
  
  def description
    @description
  end

  # Getters
  def name=(input_name)
    @name = input_name
  end

  def description=(input_description)
    @description = input_description
  end

end
##########################################
class Item
  # Expands to just Getters
  attr_reader :name, :description
end

class Item

  # Getters
  def name=(input_name)
    @name = input_name
  end

  def description=(input_description)
    @description = input_description
  end
  
end
##########################################

