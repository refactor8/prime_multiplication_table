module PrimeMultiplicationTable
  # Tests to see if an integer n, the integer to be factored, can be divided by each number in turn that is less than n.
  class TrialDivisionGenerator
    def generate(count: 10)
      prime_list = Enumerator.new do |primes|
        trial_division(primes: primes)
      end
      prime_list.take count
    end

    private

    def trial_division(primes:)
      prime = 2
      loop do
        primes << prime
        prime = Prime.next_prime(number: prime)
      end
    end
  end
end
