# Generating Random Number
random_number = Random.new.rand(5) # Where 5 is the max value
puts random_number

# Ways to output decimals with a specific fixed decimal width 

integer = 10
float = integer.to_f

puts "The float #{float.round(3)} with 2 decimal places doesn't work because the float doesn't have that much precision"
# but you can use the format syntax 
puts "Current float :  %.2f" % [float]
# Or 
puts "Current float: #{format("%.2f", float)}"