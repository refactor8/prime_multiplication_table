module PrimeMultiplicationTable
  #   Uses the trial division method or the sieve of erastothenes
  class Prime
    def self.generate(count: 10)
      generator = case PrimeMultiplicationTable.configuration.prime_generator
      when :trial_division
        TrialDivisionGenerator.new
      when :erastothenes
        EratosthenesGenerator.new
      when :atkins
        AtkinsGenerator.new
      else
        AtkinsGenerator.new
      end
      generator.generate(count: count)
    end

    def self.is_prime?(number:)
      return if number <= 1
      (2..Math.sqrt(number)).none? { |index| (number % index).zero? }
    end

    def self.next_prime(number:)
      next_number = number + 1
      next_number = next_number + 1 until is_prime?(number: next_number)
      next_number
    end

    def self.modulo_twelve(number)
      modulo = number % 12
    end

    def self.special_case?(number)
      (number == 2 || number == 3 || number == 5)
    end
  end
end
