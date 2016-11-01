# Assumes the existence of a 'weather.dat' in the same directory with the following format:
# Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP

#  1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5
#  2  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5
###########################
# In weather.dat you’ll find daily weather data for Morristown, NJ for June 2002. 
# Download this text file, then write a program to output the day number (column one) 
# with the smallest temperature spread (the maximum temperature is the second column, 
# the minimum the third column).

################## Support Methods ##################

def get_line_array_from_file(filename)
  contents_array = Array.new
  if File.exists?(filename)
    contents_array = File.readlines(filename) 
  else
    puts "ERROR: File (#{filename}), Does Not Exist."
  end
  return contents_array
end

def extract_data_hashes_from_table_array(table_array)
  index = 0 
  table_data = Array.new
  header_array = Array.new
  # Using Each contentArray Index other than '0', create and store a new hash using the headerArray for keys. 

  table_array.each do |row|
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
      table_data.push(header_hash)

    end
    index += 1 # Increment Contents_Array index
  end
  return table_data
end

################## Main Execution ##################

# Read in 'Weather.dat' File into array. Assumes index  0 is the heading data.
file_name = 'weather.dat'
# Extract file contents into table array
file_content = get_line_array_from_file(file_name)
# use heading data to form hash keys look up table based on space delimited index.
weather_data = extract_data_hashes_from_table_array(file_content)

# Initialize Variable to keep track of index with the smallest temperature spread. 
loop_index = 0
index_smallest_temp_spread = 0
min_temp_spread = 99999
small_temp_day = 0

# Loop through WeatherData Array to determine Temperature spread of each row, Set tracking index variable if determined
weather_data.each do |data|
  # puts "Line : 0 #{data.inspect}" # TEST
  if (!data.empty?)
    temp_spread = data[:MxT].to_i - data[:MnT].to_i
    # puts "Min Spread for Day : #{data[:Dy]} = #{temp_spread}" # TEST
    # Spread is smaller than currently set value.
    if (temp_spread < min_temp_spread)
      min_temp_spread = temp_spread 
      small_temp_day = data[:Dy]
      index_smallest_temp_spread = loop_index
    end
  end
  loop_index += 1
end

# Output the ID of the data index with the smallest spread.
puts 'The Weather data with the smallest Temperature spread is:'
puts "Day : #{small_temp_day} (index = #{index_smallest_temp_spread}) with Temperature Spread of : #{min_temp_spread} Degrees"
puts "Index Day = #{weather_data[index_smallest_temp_spread][:Dy]}"
puts "Index Max Temp = #{weather_data[index_smallest_temp_spread][:MxT]}"
puts "Index Min Temp = #{weather_data[index_smallest_temp_spread][:MnT]}"



