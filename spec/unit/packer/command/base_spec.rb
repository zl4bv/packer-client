require 'spec_helper'

describe Packer::Command::Base do
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
