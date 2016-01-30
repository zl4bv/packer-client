require 'spec_helper'

describe Packer::Message::Error do
  describe '.from_fields' do
    let(:fields) { %w(timestamp target error message) }

    subject { described_class.from_fields(fields) }

    its(:timestamp) { is_expected.to eq('timestamp') }
    its(:target) { is_expected.to eq('target') }
    its(:type) { is_expected.to eq('error') }
    its(:data) { is_expected.to eq(%w(message)) }
    its(:error) { is_expected.to eq('message') }
  end
end
