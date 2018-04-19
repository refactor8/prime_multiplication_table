module PrimeMultiplicationTable
  # Builds multiplication table
  class TableBuilder
    def build(count, algorithm)
      algorithm ||= PrimeMultiplicationTable.configuration.algorithm.to_s
      primes = Algorithm.process(algorithm).each(count)
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
