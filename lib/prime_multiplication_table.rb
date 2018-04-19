require 'terminal-table'
require 'prime_multiplication_table/version'
require 'prime_multiplication_table/cli'
require 'prime_multiplication_table/prime'
require 'prime_multiplication_table/prime_utility'
require 'prime_multiplication_table/command'
require 'prime_multiplication_table/table_builder'
require 'prime_multiplication_table/algorithm'
require 'prime_multiplication_table/generator'
require 'prime_multiplication_table/trial_division_generator'
require 'prime_multiplication_table/eratosthenes_generator'
require 'prime_multiplication_table/atkins_generator'

# Multiplication table of the first N prime numbers
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
  end

  class Configuration
    attr_reader :title

    def initialize
      @title = "Multiplication table for the first {{count}} prime numbers"
    end
  end
end
