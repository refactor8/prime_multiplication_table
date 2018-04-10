module PrimeMultiplicationTable
  # Prints out a multiplication table
  class MultiplicationTable
    def initialize(count: 10)
      self.count = count
      self.values = Prime.generate(count: count)
      self.headings = values.clone.unshift("")
      self.title = PrimeMultiplicationTable.configuration.table_header
    end

    def build
      formatted_table = Terminal::Table.new headings: headings, title: title do |table|
        values.length.times do |number|
          row = [values[number]]
          values.length.times do |next_number|
            row << values[number] * values[next_number]
          end
          table << row
          table << :separator unless number == (values.length - 1)
        end
      end

      formatted_table
    end

    private

    attr_accessor :headings, :title, :values, :count
  end
end
