module Inventoryable
  def self.included(base_class)
    #puts "#{base_class.class} is including Inventoryable."
    #Make all Items that include this Mixin to extend the ClassMethods
    base_class.extend(ClassMethods)
    base_class.extend(Enumerable)
  end
  
  module ClassMethods
    # Factory Method
    def create(attributes)
      object = new(attributes)
      instances.push(object)
      return object
    end
    
    def instances
      @instances ||= []
    end
    
    def each(&block)
      instances.each(&block)
    end
    
    def report(title,reportable)
      puts title
      reportable.each do |item|
        line = []
        line.push("Item: #{item.attributes[:name]}")
        line.push("Stock: #{item.stock_count}")
        if item.attributes.include?(:size)
          line.push("Size: #{item.attributes[:size]}")
        end
        puts line.join("\t")
      end
      puts "\n"
    end
    
    def in_stock_report
      title = "#{self.to_s} In Stock Report"
      reportable = instances.select{ |instance| instance.in_stock? }
      report(title,reportable)
    end

    def out_of_stock_report
      title = "#{self.to_s} Out of Stock Report"
      reportable = instances.select{ |instance| !instance.in_stock? }
      report(title,reportable)
    end
  end
  
  def stock_count
    @stock_count ||= 0
  end
  
  def stock_count=(number)
    @stock_count = number
  end
  
  def in_stock?
    stock_count > 0 #calls self-defined accessor that ensures value
  end
  
end

module Treehouse
  class Shirt
  # extend Inventoryable::ClassMethods (Obfuscated by extention in sef.included)
    include Inventoryable
    attr_accessor :attributes
    
    def initialize(attributes)
      @attributes = attributes
    end
  end
  
  class Pant
    include Inventoryable
    attr_accessor :attributes
    def initialize(attributes)
      @attributes = attributes
    end
  end
  
  class Accessory
    include Inventoryable
    attr_accessor :attributes
    def initialize(attributes)
      @attributes = attributes
    end
  end
end
  
shirt = Treehouse::Shirt.create(name: "MTF", size: "L")
shirt.stock_count = 10

shirt = Treehouse::Shirt.create(name: "MTF2", size: "L")

shirt = Treehouse::Shirt.create(name: "MTF", size: "M")
shirt.stock_count = 9

pant = Treehouse::Pant.create(name: "Jeans", size: "M")
pant.stock_count = 2

pant = Treehouse::Pant.create(name: "Jeans", size: "S")
pant.stock_count = 4

accessory = Treehouse::Accessory.create(name: "Belt", size: "M")
accessory.stock_count = 1

accessory = Treehouse::Accessory.create(name: "Belt", size: "L")
accessory.stock_count = 1

accessory = Treehouse::Accessory.create(name: "Necklace")
accessory.stock_count = 1

Treehouse::Shirt.in_stock_report
Treehouse::Pant.in_stock_report
Treehouse::Accessory.in_stock_report
Treehouse::Shirt.out_of_stock_report