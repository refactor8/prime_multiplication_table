module PrimeMultiplicationTable
  # Sieve of Erathosthenes algorithm
  # https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes#Algorithmic_complexity
  class EratosthenesGenerator

    def initialize
      self.primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101]
      self.last_checked = primes.last + 1
    end

    def get_nth_prime(number)
      compute_primes while primes.size <= number
      primes[number]
    end

    def generate(count: 10)
      compute_primes while primes.size <= count
      primes.slice(0, count)
    end

    private

    attr_accessor :primes, :segment_size, :cached_prime, :last_checked, :segment_min, :segment_max, :root, :segment

    def initialize_variables
      set_cached_values
      set_segment_values
      set_root
    end

    def set_cached_values
      self.cached_prime = primes.last
      self.last_checked = cached_prime + 1 if cached_prime > last_checked
    end

    def set_segment_values
      self.segment_size = 1e6.to_i
      self.segment_min = last_checked
      self.segment_max = [segment_min + segment_size, cached_prime * 2].min
      self.segment = ((segment_min + 1) .. segment_max).step(2).to_a
    end

    def set_root
      self.root = Integer(Math.sqrt(segment_max).floor)
    end

    def compute_primes
      initialize_variables

      (1..Float::INFINITY).each do |sieving|
        prime = primes[sieving]
        break if prime > root
        composite_index = (-(segment_min + 1 + prime) / 2) % prime
        while composite_index < segment.size do
          segment[composite_index] = nil
          composite_index += prime
        end
      end

      primes.concat(segment.compact!)
      last_checked = segment_max
    end
  end
end
