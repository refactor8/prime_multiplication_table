module PrimeMultiplicationTable
  # Reads the number of primes from the terminal
  class CLI
    attr_reader :builder

    def initialize
      @builder = PrimeMultiplicationTable::TableBuilder.new
    end

    def load_command(command)
      PrimeMultiplicationTable::Command.process(command)
    end

    def run(command)
      command, *args = command
      builder.send(command, *args)
    end
  end
end
