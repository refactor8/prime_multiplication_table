module PrimeMultiplicationTable
  class CLI
    attr_reader :builder

    def initialize
      @builder = PrimeMultiplicationTable::TableBuilder.new
    end

    def load_commands(commands)
      PrimeMultiplicationTable::Command.process(commands)
    end

    def run(commands)
      commands.each do |command, *args|
        builder.send(command, *args)
      end
    end
  end
end
