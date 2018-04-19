module PrimeMultiplicationTable
  # Generator abstract class
  class Generator
    include Enumerable

    def initialize
      self.upper_bound = 1e6.to_i
      self.primes = Set.new [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101]
    end

    protected

    attr_accessor :upper_bound, :primes

    def before_perform; end;
    def perform; end;
    def after_perform; end;
  end
end
