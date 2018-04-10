require 'spec_helper'

RSpec.describe PrimeMultiplicationTable::AtkinsGenerator do
  describe '#generate' do
    it "generates the first 10 prime numbers" do
      result = PrimeMultiplicationTable::AtkinsGenerator.new.generate(count: 10)
      expect(result).to match_array([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
    end
  end
end
