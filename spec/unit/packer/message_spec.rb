require 'spec_helper'

describe Packer::Message do
  subject { described_class.new('timestamp,target,type,data') }

  describe '#data' do
    context 'when data contains no values' do
      subject { described_class.new('timestamp,target,type') }

      it 'returns an empty array' do
        expect(subject.data).to eq([])
      end
    end

    context 'when data contains one value' do
      it 'returns an array with one item' do
        expect(subject.data).to eq(['data'])
      end
    end

    context 'when data contains multiple values' do
      subject { described_class.new('timestamp,target,type,data1,data2,data3') }

      it 'returns an array with multiple values' do
        expect(subject.data).to eq(%w(data1 data2 data3))
      end
    end
  end

  describe '#line' do
    it 'returns the line' do
      expect(subject.line).to eq('timestamp,target,type,data')
    end
  end

  describe '#parsed_line' do
    it 'returns an array' do
      expect(subject.parsed_line).to eq(%w(timestamp target type data))
    end
  end

  describe '#target' do
    it 'returns the target' do
      expect(subject.target).to eq('target')
    end
  end

  describe '#timestamp' do
    it 'returns the timestamp' do
      expect(subject.timestamp).to eq('timestamp')
    end
  end

  describe '#type' do
    it 'returns the message type' do
      expect(subject.type).to eq('type')
    end
  end
end
