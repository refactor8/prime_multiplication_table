module PrimeMultiplicationTable
  # Builds multiplication table
  class TableBuilder
    def build(count, algorithm=nil)
      @generator = Algorithm.new(algorithm).process
      if @generator.eql? :invalid
        puts "Invalid algorithm. Valid values are: atkins, eratosthenes, trial"
        return
      end
      build_table(count)
    end

    private

    def build_table(count)
      primes = @generator.each(count)
      title = PrimeMultiplicationTable.configuration.title
      headings = primes.clone.unshift("")
      rows = PrimeMultiplicationTable::PrimeUtility.multiply(primes)
      puts Terminal::Table.new(headings: headings, title: title, rows: rows)
    end

    def invalid(command)
      puts "'#{command.strip}' is an invalid command"
    end
  end
end
