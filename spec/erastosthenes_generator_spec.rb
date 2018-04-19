require 'spec_helper'

RSpec.describe PrimeMultiplicationTable::EratosthenesGenerator do
  describe '#each' do
    it "generates the first 10 prime numbers" do
      result = PrimeMultiplicationTable::EratosthenesGenerator.new.each(10)
      expect(result).to match_array([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
    end

    it "generates the first 30 prime numbers" do
      result = PrimeMultiplicationTable::EratosthenesGenerator.new.each(30)
      expect(result).to match_array([2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113])
    end

  end
end
