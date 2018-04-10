require "terminal-table"
require "prime_multiplication_table/version"
require "prime_multiplication_table/configuration"
require "prime_multiplication_table/prime"
require "prime_multiplication_table/trial_division_generator"
require "prime_multiplication_table/eratosthenes_generator"
require "prime_multiplication_table/atkins_generator"
require "prime_multiplication_table/multiplication_table"

# Multiplication table of the first count prime numbers
module PrimeMultiplicationTable
  class << self
    attr_reader :configuration

    def configure
      @configuration ||= Configuration.new
      yield(configuration)
    end

    def reset
      @configuration = Configuration.new
    end

    def print(count: 10)
      title = self.configuration.table_header
      MultiplicationTable.new(count: count).build
    end
  end
end

PrimeMultiplicationTable.configure do |config|
  config.prime_generator = :trial_division
  config.table_header = "Multiplication table for the first 10 prime numbers"
end
