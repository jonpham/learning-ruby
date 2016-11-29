# Given a set 'S' of Numbers, provide every combination of Subset numbers from 's' that sum up to a Target 'T.'
#EXAMPLE SET
# [1,2,3,4,5]
#EXPECTED SUM : 15
#POSSIBLE COMBINATINOS
# [1,4,5]
# [1,2,3,4]
# [2,3,5]

require 'rspec'

# Data Definition
test_set1 = [1,2,3,4,5]

class SumFinder
  attr_accessor :valid_combos, :count

  def initialize
    @valid_combos = []
    @count = 0
  end

  def find_number_permutations(data_set,expected_sum)
    recursive_sum_finder(data_set,expected_sum,curr_candidates=[])
    return @count
  end

  def recursive_sum_finder(data_set,expected_sum,curr_candidates=[])
    potential_sum = sum_array(curr_candidates)

    add_combo (curr_candidates) if potential_sum == expected_sum
    return if potential_sum >= expected_sum

    (0..(data_set.size-1)).each do |i|
      pop_item = data_set[i]
      reduced_data_set = data_set.drop(i+1)
      recursive_sum_finder(reduced_data_set,expected_sum, curr_candidates + [pop_item])
    end
  end

  def add_combo(valid_set)
    sorted_set = valid_set.sort
    if (@valid_combos.find_index(sorted_set) == nil)
      @valid_combos.push(sorted_set)
      @count += 1
    end
  end

  def sum_array(array)
    return array.inject(0) {|sum,i| sum +i}
  end
end

class ComboFinder
  attr_accessor :count, :combos
  def initialize 
    @count=0
    @recursion_count = 0
    @combos = []
  end

  def add_combo(combo)
    if @combos.find_index(combo.sort) == nil
      @combos.push(combo.sort)
      @count += 1 
    end
  end


  def recursive_sum_counter(data_set,sum_expectation,partial=[])
    # partial_sum = getSum(data_set)
    @recursion_count += 1
    puts "-"*40
    puts "Recursion #{@recursion_count}"
    # puts @recursion_count
    partial_sum = get_sum(partial)
    puts "Building Array == \n#{partial.inspect}"
    puts "Building Array sum == #{partial_sum}"

    # Iterate if partial sum is a valid combination
    self.add_combo(partial) if partial_sum == sum_expectation
    # Return 0 when total sum of data points is < sum expectation
    puts "Partial Sum >= Expected Sum, Returning" if partial_sum >= sum_expectation
    return if partial_sum >= sum_expectation

    (0..(data_set.length - 1)).each do |i|
      puts "For Each Item in Remaining Input set."
      puts "Recursion \##{@recursion_count}:"
      puts "Data Set = #{data_set.inspect}"
      puts "i = #{i}"
      n = data_set[i]
      remaining = data_set.drop(i+1)
      puts "Removal of i+1 first items from dataset =="
      puts remaining.inspect
      puts "Passed into recursion with Building array (#{partial})+ [#{n}]"
      recursive_sum_counter(remaining,sum_expectation,partial + [n])
    end
  end

  def find_count(data_set,sum_expectation)
    recursive_sum_counter(data_set,sum_expectation)
  end

  def get_sum(array)
    return array.inject(0){|sum,x| sum + x }
  end

end


sumFinder = SumFinder.new
ans = sumFinder.find_number_permutations(test_set1,10)
# puts ans
finder = ComboFinder.new
answer = finder.find_count(test_set1,10)

puts '-'*40
puts finder.count
puts finder.combos.inspect

RSpec.describe ComboFinder do 
  describe '#get_sum' do 
    it 'should return the sum of all items in the array' do
      finder = ComboFinder.new 
      expect(finder.get_sum(test_set1)).to eq(15)
    end
  end
  describe '#find_count' do 
    it 'should return the count of all possible combinations of sums from a set equaling a specific total' do
      finder = ComboFinder.new
      expect(finder.find_count(test_set1,15)).to eq(3)
    end
    it 'should return 0 when sum of array is less than expected sum' do
      finder = ComboFinder.new
      expect(finder.find_count(test_set1,20)).to eq(0)
    end
  end
end