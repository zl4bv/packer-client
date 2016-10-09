require 'spec_helper'

describe Packer::Output::Fix do
  let(:exitstatus) { 0 }
  let(:output) { 'JSON output' }

  subject { described_class.new(shellout_double(output, '', exitstatus)) }

  describe '#json' do
    context 'when the template is valid' do
      before do
        allow(subject).to receive(:valid?).and_return(true)
      end

      it 'returns a JSON string' do
        expect(subject.json).to eq(output)
      end
    end

    context 'when the template is not valid' do
      before do
        allow(subject).to receive(:valid?).and_return(false)
      end

      it 'returns nil' do
        expect(subject.json).to be_nil
      end
    end
  end

  describe '#valid?' do
    context 'when packer validate exits with 0' do
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
