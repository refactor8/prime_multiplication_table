require 'spec_helper'

RSpec.describe PrimeMultiplicationTable::PrimeUtility do
  subject { described_class }

  describe '.is_prime?' do
    it "tests if 5 is a prime number" do
      expect(subject.is_prime?(5)).to eq true
    end

    it "tests if 8 is a prime number" do
      expect(subject.is_prime?(8)).to eq false
    end
  end

  describe '.next_prime' do
    it "returns the next prime number" do
      expect(subject.next_prime(3)).to eq 5
    end
  end

  describe '.modulo_twelve' do
    it "computes the modulo twelve of a prime number" do
      expect(subject.modulo_twelve(101)).to eq 5
    end

    it "computes the module twelve of a composite number" do
      expect(subject.modulo_twelve(100)).to eq 4
    end
  end

  describe '.multiply' do
    it "returns an array with the result of the multiplication of primes" do
      expect(subject.multiply([2,3,5,7])).to be_kind_of(Enumerator)
    end
  end
end
