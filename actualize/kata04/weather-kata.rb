# In weather.dat you’ll find daily weather data for Morristown, NJ for June 2002. Download this text file, then write a program to output the day number (column one) with the smallest temperature spread (the maximum temperature is the second column, the minimum the third column).

# Read in 'Weather.dat' File into array. where index  0 is the heading data.
file_name = "weather.dat"

contents_array = Array.new
if File.exists?(file_name)
  contents_array = File.readlines(file_name) 
end

#####  Test ######
# index = 0
# contents_array.each do |line|
#   print index
#   print line
#   index += 1
# end
####################

# use heading data to form hash keys look up table based on space delimited index.
index = 0 
weather_data = Array.new
header_array = Array.new
# Using Each contentArray Index other than '0', create and store a new hash using the headerArray for keys. 

contents_array.each do |row|
  if (index == 0)
    header_array = row.split # Returns Array of each Heading Column Item
    # puts header_array.inspect
  else
    column_index = 0
    header_hash = Hash.new

    # Go through each row of the weather data except first row to write that row's data into hash object.
    data_row = row.split # Returns Array of Data Row Items
    # puts data_row.inspect # [TEST]
    
    data_row.each do |column_item|
      # Get Hash Key from 'headerArray'
      key = header_array.at(column_index).to_s.to_sym
      # puts "Trying to Add item : #{column_item} with Key : #{key.to_s}" # [TEST]
      header_hash.store(key,column_item)
      column_index += 1
    end
    # puts header_hash.inspect # [TEST]
    # Add Hash object to Parsed Data Array.
    weather_data.push(header_hash)

  end
  index += 1 # Increment Contents_Array index
end

puts weather_data[0].inspect

# Initialize Variable to keep track of index with the smallest temperature spread. 
loop_index = 0
index_smallest_temp_spread = 0
min_temp_spread = 99999

# Loop through WeatherData Array to determine Temperature spread of each row, Set tracking index variable if determined
weather_data.each do |data|
  if (!data.empty?)
    temp_spread = data[:MxT].to_i - data[:MnT].to_i
    # Spread is smaller than currently set value.
    if (temp_spread < min_temp_spread)
      min_temp_spread = temp_spread 
      index_smallest_temp_spread = loop_index
    end
    loop_index += 1
  end
end

# Output the ID of the data index with the smallest spread.
puts "The Weather data with the smallest Temperature spread is:"
puts "Day : #{weather_data[index_smallest_temp_spread][:Dy]} with Temperature Spread of : #{min_temp_spread} Degrees"



