module PrimeMultiplicationTable
  # Prime number class
  class Prime
    include Enumerable

    def initialize(generator)
      @generator = generator
    end

    def each(count, &block)
      generator.upper_bound = count
      generator.each(&block)
    end
  end
end
