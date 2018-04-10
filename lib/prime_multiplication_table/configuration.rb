module PrimeMultiplicationTable
# Gem configuration
  class Configuration
    attr_accessor :prime_generator, :table_header

    def initialize
      self.prime_generator = :atkins
      self.table_header = "Multiplication table for the first 10 prime numbers"
    end
  end
end
