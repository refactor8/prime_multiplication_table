require 'spec_helper'

RSpec.describe PrimeMultiplicationTable::Prime do
  describe '#generate' do
    it 'generates the first 10 prime numbers' do
      result = PrimeMultiplicationTable::TrialDivisionGenerator.new.generate(count: 10)
      expect(result).to match_array([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
    end

    it 'generates number using the trial division generator' do
      PrimeMultiplicationTable.configure { |config| config.prime_generator = :trial_division }
      result = PrimeMultiplicationTable::TrialDivisionGenerator.new.generate(count: 10)
      expect(result).to match_array([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
    end

    it 'generates number using the Sieve of Erastothenes generator' do
      PrimeMultiplicationTable.configure { |config| config.prime_generator = :erastothenes }
      result = PrimeMultiplicationTable::TrialDivisionGenerator.new.generate(count: 10)
      expect(result).to match_array([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
    end

    it 'generates number using the Sieve of Atkins generator' do
      PrimeMultiplicationTable.configure { |config| config.prime_generator = :atkins }
      result = PrimeMultiplicationTable::TrialDivisionGenerator.new.generate(count: 10)
      expect(result).to match_array([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
    end
  end

  describe '.is_prime?' do
    it "tests for primality of a number" do
      expect(described_class.is_prime?(number:5)).to eq true
      expect(described_class.is_prime?(number:8)).to eq false
    end
  end

  describe '.next_prime' do
    it "returns the next prime number" do
      expect(described_class.next_prime(number:3)).to eq 5
    end
  end

  it 'benchmark the performance of prime generation algorithms' do
    puts "First 1000 prime numbers benchmarks:"
    Benchmark.bm(15) do |x|
      x.report("Atkins:") do
        PrimeMultiplicationTable.configure { |config| config.prime_generator = :atkins }
        PrimeMultiplicationTable::TrialDivisionGenerator.new.generate(count: 1_000)
      end
      x.report("Eratosthenes:") do
        PrimeMultiplicationTable.configure { |config| config.prime_generator = :erastothenes }
        PrimeMultiplicationTable::TrialDivisionGenerator.new.generate(count: 1_000)
      end
      x.report("Trial Division:") do
        PrimeMultiplicationTable.configure { |config| config.prime_generator = :trial_division }
        PrimeMultiplicationTable::TrialDivisionGenerator.new.generate(count: 1_000)
      end
    end
  end
end
