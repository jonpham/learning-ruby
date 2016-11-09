module Namespace
  
  module BehaviorInheritanceModule
    #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    # Special Inclusion Constructor
    # that is executed by all Classes which include this module (mixin)
    def self.included(base_class)
      attr_accessor :iterator_count, :name
      puts "The #{base_class.to_s} includes the BehaviorInheritanceModule."
    end
    #%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    def do_something(text)
      puts text
      @iterator_count ||= 0 #If not set, set to 0
      @iterator_count += 1 #iterate on action
      puts "#{@name} shall do_something for the #{@iterator_count} time."
    end
  end
  
  class SampleClass
    include BehaviorInheritanceModule

    attr_accessor :name

    def initialize
      @name = "SampleClass"
      # @iterator_count = 2
    end

    def do_something_else
      puts "Doing something else"
    end
  end
end

app = Namespace::SampleClass.new
#Included Method
app.do_something("Fetch the Ball.")
#Self Method
app.do_something_else
