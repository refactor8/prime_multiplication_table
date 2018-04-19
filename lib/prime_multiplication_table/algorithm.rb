module PrimeMultiplicationTable
  class Algorithm
    def self.process(algorithm)
      case algorithm
      when /\AATKINS\Z/i
        AtkinsGenerator.new
      when /\AERATOSTHENES\Z/i
        EratosthenesGenerator.new
      when /\ATRIAL\Z/i
        TrialDivisionGenerator.new
      else
        [:invalid]
      end
    end
  end
end
