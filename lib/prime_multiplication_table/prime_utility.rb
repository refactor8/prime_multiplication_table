module PrimeMultiplicationTable
  # Utility methods used to generate primes
  class PrimeUtility
    class << self
      def is_prime?(number)
        (2..Math.sqrt(number)).none? { |index| (number % index).zero? }
      end

      def next_prime(number)
        next_number = number + 1
        next_number += 1 until is_prime?(next_number)
        next_number
      end

      def modulo_twelve(number)
        number % 12
      end

      def multiply(primes, &block)
        Enumerator.new do |rows|
          primes.each do |a|
            row = [a]
            primes.each do |b|
             row << a * b
            end
            rows << row
          end
        end
      end
    end
  end
end
