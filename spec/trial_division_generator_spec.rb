require 'spec_helper'

RSpec.describe PrimeMultiplicationTable::TrialDivisionGenerator do
  describe '#generate' do
    it "generates the first 10 prime numbers" do
      result = PrimeMultiplicationTable::TrialDivisionGenerator.new.each(10)
      expect(result).to match_array([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
    end

    it "returns the first 26 prime numbers" do
      result = PrimeMultiplicationTable::TrialDivisionGenerator.new.each(26)
      expect(result).to match_array([2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101])
    end

    it "returns the first 46 prime numbers" do
      result = PrimeMultiplicationTable::TrialDivisionGenerator.new.each(46)
      expect(result).to match_array([2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199])
    end
  end
end
