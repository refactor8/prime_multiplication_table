require 'spec_helper'

RSpec.describe PrimeMultiplicationTable::Prime do
  describe '#generate' do
    it 'generates the first 10 prime numbers' do
      result = PrimeMultiplicationTable::AtkinsGenerator.new.each(10)
      expect(result).to match_array([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
    end

    it 'generates number using the trial division generator' do
      result = PrimeMultiplicationTable::TrialDivisionGenerator.new.each(10)
      expect(result).to match_array([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
    end

    it 'generates number using the Sieve of Erastothenes generator' do
      result = PrimeMultiplicationTable::EratosthenesGenerator.new.each(10)
      expect(result).to match_array([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
    end

    it 'generates number using the Sieve of Atkins generator' do
      result = PrimeMultiplicationTable::AtkinsGenerator.new.each(10)
      expect(result).to match_array([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
    end
  end

  it 'benchmark the performance of prime generation algorithms' do
    count = 1_000_000
    puts "First #{count} prime numbers benchmarks:"
    Benchmark.bm(15) do |x|
      require 'prime'
      x.report("Ruby Core Prime:") { Prime.prime?(count) }
      x.report("Atkins:") { PrimeMultiplicationTable::AtkinsGenerator.new.each(count) }
      x.report("Erastothenes:") { PrimeMultiplicationTable::EratosthenesGenerator.new.each(count) }
      if count < 100_000
        x.report("Trial Division:") { PrimeMultiplicationTable::TrialDivisionGenerator.new.each(count) }
      end
    end
  end
end
