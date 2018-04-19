module PrimeMultiplicationTable
  # Sieve of Erathosthenes algorithm
  # https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes#Algorithmic_complexity
  class EratosthenesGenerator < Generator
    def each(ubound, &block)
      @ubound = ubound
      perform
    end

    private

    def perform
      last_checked = primes.to_a.last
      segment_min = last_checked
      segment_max = [segment_min + upper_bound, last_checked * 2].min
      sieve(segment_max).take(@ubound)
    end

    def sieve(max)
      candidates = []
      (2..max).each { |number| candidates[number] = number }
      (2..Math.sqrt(max)).each do |number|
  	    (number*number).step(max, number) do |candidate|
          candidates[candidate] = nil if candidates[candidate]
        end
  	  end
      candidates.compact
  	end
  end
end
