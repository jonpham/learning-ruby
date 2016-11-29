require 'rspec'
# Write a method to decide if two strings are anagrams or not

class AnagramChecker
  def isAnagram(first_string,second_string)
    return isAnagramRuby(first_string,second_string)
  end

  def isAnagramNaive(first_string,second_string)
    # Check quick answers
    return false if first_string.length != second_string.length

    # Create Character Hash
    char_hash = Hash.new
    ('a'...'z').each {| char | char_hash.store(char,false) }
    first_string.each_char { |char| char_hash[char]=true }      
    second_string.each_char { |char| 
      return false if char_hash[char] != true
    }
    return true
  end

  def isAnagramRuby(first_string,second_string)
    # Check quick answers
    return false if first_string.length != second_string.length

    # Sort String then Compare
    return false unless first_string.chars.sort == second_string.chars.sort
    return true
  end
end

# Test Driver

RSpec.describe AnagramChecker do 
  describe '#isAnagramNaive' do 
    it 'should check to see if two strings are anagrams of each other.' do
      checker = AnagramChecker.new
      test_string_1 = "cinema"
      test_string_2 = "iceman"
      expect(checker.isAnagramNaive(test_string_1,test_string_2)).to eq(true)
    end
    it 'should return false if the two input parameters are different length.' do
      checker = AnagramChecker.new
      expect(checker.isAnagramNaive("cinemas","iceman")).to eq(false)
    end
  end

  describe '#isAnagramRuby' do
    it 'should check to see if two strings are anagrams of each other.' do
      checker = AnagramChecker.new
      test_string_1 = "cinema"
      test_string_2 = "iceman"
      expect(checker.isAnagramRuby(test_string_1,test_string_2)).to eq(true)
    end

    it 'should check to see if two strings are anagrams of each other.' do
      checker = AnagramChecker.new
      test_string_1 = "babie"
      test_string_2 = "babee"
      expect(checker.isAnagramRuby(test_string_1,test_string_2)).to eq(false)
    end
  end

  describe '#isAnagram' do
    it 'should check to see if two strings are anagrams of each other.' do
      checker = AnagramChecker.new
      test_string_1 = "cinema"
      test_string_2 = "iceman"
      expect(checker.isAnagram(test_string_1,test_string_2)).to eq(true)
    end
  end
end

