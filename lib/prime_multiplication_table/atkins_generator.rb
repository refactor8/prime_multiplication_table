module PrimeMultiplicationTable
  # Sieve of Atkins algorithm
  class AtkinsGenerator
    def initialize
      self.primes = []
      self.limit = 1e6.to_i
    end

    def generate(count: 10)
      return 2 if count == 1
      compute_primes while primes.size <= count
      primes.slice(0, count)
    end

    private

    attr_accessor :primes, :limit, :sieve

    def sieve_number(x)
      y = 1
      while ((y*y) < limit)
        n = (4*x*x)+(y*y)
        if (n <= limit && (n % 12 == 1 || n % 12 == 5))
          sieve[n] ^= true
        end

        n = (3*x*x)+(y*y)
        if (n <= limit && n % 12 == 7)
          sieve[n] ^= true
        end

        n = (3*x*x)-(y*y)
        if (x > y && n <= limit && n % 12 == 11)
          sieve[n] ^= true
        end

        y += 1
      end
    end

    def sieving
      x = 1
      while ((x*x) < limit)
        sieve_number(x)
        x += 1
      end
    end

    def mark_squares
      r = 5
      while ((r*r) < limit)
        if (sieve[r])
          i = r*r
          while i < limit
            sieve[i] = false
            i += r*r
          end
        end
        r += 1
      end
    end

    def get_primes
      a = 5
      while a < limit
        if sieve[a]
          primes << a
        end
        a += 1
      end
      primes
    end

    def initialize_variables
      self.sieve = Array.new(limit, false)
      primes << 2 if (limit > 2)
      primes << 3 if (limit > 3)
    end

    def compute_primes
      initialize_variables
      sieving
      mark_squares
      get_primes
    end
  end
end
