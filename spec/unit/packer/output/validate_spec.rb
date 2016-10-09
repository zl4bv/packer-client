require 'spec_helper'

describe Packer::Output::Validate do
  subject { described_class.new(shellout_double('', '', exitstatus)) }

  describe '#valid?' do
    context 'when packer validate exits with 0' do
      let(:exitstatus) { 0 }

      it 'returns true' do
        expect(subject.valid?).to be_truthy
      end
    end

    context 'when packer validate exists with 1' do
      let(:exitstatus) { 1 }

      it 'returns false' do
        expect(subject.valid?).to be_falsey
      end
    end
  end
end
