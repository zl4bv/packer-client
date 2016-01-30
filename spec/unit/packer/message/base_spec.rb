require 'spec_helper'

describe Packer::Message::Base do
  describe '.from_fields' do
    let(:fields) { %w(timestamp target type data1 data2) }

    subject { described_class.from_fields(fields) }

    its(:timestamp) { is_expected.to eq('timestamp') }
    its(:target) { is_expected.to eq('target') }
    its(:type) { is_expected.to eq('type') }
    its(:data) { is_expected.to eq(%w(data1 data2)) }
  end
end
