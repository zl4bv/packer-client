require 'spec_helper'

describe Packer::Command::Build do
  describe '#messages' do
    let(:line1) { 'ts1,tgt1,type1,data1' }
    let(:line2) { 'ts2,tgt2,type2,data2' }

    subject { described_class.new(shellout_double("#{line1}\n#{line2}")) }

    it 'returns an array of machine-readable messages' do
      expect(subject.messages.length).to eq(2)
      expect(subject.messages[0].line).to eq(line1)
      expect(subject.messages[1].line).to eq(line2)
    end
  end

  describe '#stderr' do
    subject { described_class.new(shellout_double('', 'example')) }

    it 'returns the raw error output' do
      expect(subject.stderr).to eq('example')
    end
  end

  describe '#stdout' do
    subject { described_class.new(shellout_double('example')) }

    it 'returns the raw standard output' do
      expect(subject.stdout).to eq('example')
    end
  end
end
