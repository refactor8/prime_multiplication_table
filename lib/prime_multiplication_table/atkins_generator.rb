module PrimeMultiplicationTable
  # Atkins algorithm
  class AtkinsGenerator < Generator
    def each(ubound, &block)
      @ubound = ubound
      before_perform
      perform
      after_perform(&block).take(ubound)
    end

    private

    attr_accessor :candidates
    attr_reader :ubound

    def before_perform
      self.candidates = Array.new(upper_bound, false)
    end

    def cached?
      primes.slice(0, upper_bound) if primes.size >= upper_bound
    end

    def perform
      cached?

      (1..Float::INFINITY).each do |number|
        sieve(number)
        break if (number * number) > upper_bound
      end

      sieve_squares
    end

    def after_perform(&block)
      Enumerator.new do |numbers|
        numbers << 2 if (upper_bound > 2)
        numbers << 3 if (upper_bound > 3)
        candidates.each_index do |index|
          numbers << index if candidates[index]
          yield index if block_given?
        end
      end
    end

    def sieve(number)
      (1..Float::INFINITY).each do |candidate|
        ['first', 'second', 'third'].each do |method|
          send("#{method}_step", number, candidate)
        end
        break if (candidate*candidate) > upper_bound
      end
    end

    def sieve_squares
      (5..Float::INFINITY).each do |number|
        if candidates[number]
          min = number * number
          (min..Float::INFINITY).step(min) do |root|
            candidates[root] = false
            break if root > upper_bound
          end
        end

        break if (number * number) > upper_bound
      end
    end

    def first_step(number, candidate)
      result = (4 * number*number) + (candidate * candidate)
      if (result <= upper_bound && (result % 12 == 1 || result % 12 == 5))
        candidates[result] ^= true
      end
    end

    def second_step(number, candidate)
      result = (3 * number * number) + (candidate * candidate)
      if (result <= upper_bound && result % 12 == 7)
        candidates[result] ^= true
      end
    end

    def third_step(number, candidate)
      result = (3 * number * number) - (candidate * candidate)
      if (number > candidate && result <= upper_bound && result % 12 == 11)
        candidates[result] ^= true
      end
    end
  end
end
