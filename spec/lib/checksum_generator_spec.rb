require 'spec_helper'
require 'checksum_generator'

describe ChecksumGenerator do
  describe '.generate 1st string' do
    cg = ChecksumGenerator.new('foo bar baz wibble fizzbuzz fizz buzz').generate
    it 'original words' do
      expect(cg[:number_of][:original_words]).to eq(7)
    end
    it 'original characters' do
      expect(cg[:number_of][:original_characters]).to eq(37)
    end
    it 'newly created words' do
      expect(cg[:number_of][:newly_created_words]).to eq(4)
    end
    it 'upper case vowels' do
      expect(cg[:number_of][:upper_case_vowels]).to eq(5)
    end
    it 'consonants' do
      expect(cg[:number_of][:consonants]).to eq(21)
    end
  end
  describe '.generate 2nd string' do
    cg = ChecksumGenerator.new('The quick brown fox jumps over the lazy dog').generate
    it 'original words' do
      expect(cg[:number_of][:original_words]).to eq(9)
    end
    it 'original characters' do
      expect(cg[:number_of][:original_characters]).to eq(43)
    end
    it 'newly created words' do
      expect(cg[:number_of][:newly_created_words]).to eq(4)
    end
    it 'upper case vowels' do
      expect(cg[:number_of][:upper_case_vowels]).to eq(3)
    end
    it 'consonants' do
      expect(cg[:number_of][:consonants]).to eq(24)
    end
  end
end
