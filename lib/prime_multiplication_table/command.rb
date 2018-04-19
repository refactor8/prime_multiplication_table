module PrimeMultiplicationTable
  class Command
    def self.process(command)
      case command
      when /(?<number>\d+) (?<algorithm>\w+)\Z/i
        [:build, $~[:number].to_i, $~[:algorithm]]
      else
        [:invalid]
      end
    end
  end
end
