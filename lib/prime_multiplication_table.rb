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
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration) if block_given?
    end

    def reset
      @configuration = Configuration.new
    end
  end

  class Configuration
    attr_accessor :title, :algorithm

    def initialize
      @algorithm = :atkins
      @title = "Multiplication table for the first N prime numbers"
    end
  end
end

PrimeMultiplicationTable.configure
