require 'spec_helper'

RSpec.describe PrimeMultiplicationTable do

  subject(:table) { PrimeMultiplicationTable.print(count: 10) }

  it "has a version number" do
    expect(PrimeMultiplicationTable::VERSION).not_to be nil
  end

  it { is_expected.to be_kind_of(Terminal::Table) }

  it "returns a table with 10 rows" do
    expect(table.rows.length).to eq(10)
  end

  it "returns a table with 10 columns + 1 heading column" do
    expect(table.columns.length).to eq(11)
  end
end
