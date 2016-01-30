require 'spec_helper'

describe Packer::Message::Ui do
  describe '.from_fields' do
    let(:fields) { %w(timestamp target ui say hello) }

    subject { described_class.from_fields(fields) }

    its(:timestamp) { is_expected.to eq('timestamp') }
    its(:target) { is_expected.to eq('target') }
    its(:type) { is_expected.to eq('ui') }
    its(:data) { is_expected.to eq(%w(say hello)) }
    its(:ui_message_type) { is_expected.to eq('say') }
    its(:output) { is_expected.to eq('hello') }
  end
end
