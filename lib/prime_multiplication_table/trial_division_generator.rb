module PrimeMultiplicationTable
  # Trial Division algorithm
  class TrialDivisionGenerator < Generator
    def each(ubound, &block)
      @ubound = ubound
      perform
    end

    def perform
      list = Enumerator.new do |candidates|
        prime = 2
        0.upto(@ubound) do
          candidates << prime
          prime = PrimeUtility.next_prime(prime)
        end
      end
      list.take ubound
    end

    private

    attr_reader :ubound
  end
end
