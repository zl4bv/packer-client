require 'spec_helper'

describe Packer::Command::Fix do
  let(:output) { 'JSON output' }

  subject { described_class.new(shellout_double(output)) }

  describe '#json' do
    it 'returns a JSON string' do
      expect(subject.json).to eq(output)
    end
  end
end
