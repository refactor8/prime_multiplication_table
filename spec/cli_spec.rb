require 'spec_helper'

RSpec.describe PrimeMultiplicationTable::CLI do
  subject { PrimeMultiplicationTable::CLI.new }

  it "loads command from a string" do
    command = "10 ATKINS"
    commands = subject.load_commands(command)
    expect(commands).to eq([:build, 10, "ATKINS"])
  end

  context "run" do
    let(:builder) {
      instance_double(PrimeMultiplicationTable::TableBuilder)
    }

    before do
      allow(subject).to receive(:builder) { builder }
    end

    context "build command" do
      it "passes a build command to the table builder" do
        expect(builder).to receive(:build).with(10, "ATKINS")
        subject.run([[:build, 10, "ATKINS"]])
      end
    end
  end
end
