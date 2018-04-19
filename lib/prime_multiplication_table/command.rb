module PrimeMultiplicationTable
  class Command
    def self.process(command)
      case command.to_s
      when /(?<number>\d+)\s*(?<algorithm>\w+)?\Z/i
        [:build, $~[:number].to_i, $~[:algorithm]]
      else
        [:invalid]
      end
    end
  end
end
