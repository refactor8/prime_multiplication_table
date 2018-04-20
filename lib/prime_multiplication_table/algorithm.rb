module PrimeMultiplicationTable
  # Algorithm used to generate prime numbers
  class Algorithm
    attr_reader :algorithm

    def initialize(algorithm = nil)
      @algorithm = algorithm
      process if algorithm
      set_default unless algorithm
    end

    def process
      case algorithm
      when /\AATKINS\Z/i
        AtkinsGenerator.new
      when /\AERATOSTHENES\Z/i
        EratosthenesGenerator.new
      when /\ATRIAL\Z/i
        TrialDivisionGenerator.new
      else
        :invalid
      end
    end

    def set_default
      @algorithm = PrimeMultiplicationTable.configuration.algorithm
    end
  end
end
