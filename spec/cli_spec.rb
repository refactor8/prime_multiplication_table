require 'spec_helper'

RSpec.describe PrimeMultiplicationTable::CLI do
  subject { PrimeMultiplicationTable::CLI.new }

  it "loads command from a string" do
    command = subject.load_command("10 atkins")
    expect(command).to eq([:build, 10, :atkins.to_s])
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
        expect(builder).to receive(:build).with(10, :atkins)
        subject.run([[:build, 10, :atkins]])
      end
    end
  end
end
