require 'spec_helper'

describe Packer::Message::TemplateBuilder do
  describe '.from_fields' do
    let(:fields) { %w(timestamp target template-builder builder-name builder-type) }

    subject { described_class.from_fields(fields) }

    its(:timestamp) { is_expected.to eq('timestamp') }
    its(:target) { is_expected.to eq('target') }
    its(:type) { is_expected.to eq('template-builder') }
    its(:data) { is_expected.to eq(%w(builder-name builder-type)) }
    its(:name) { is_expected.to eq('builder-name') }
    its(:builder_type) { is_expected.to eq('builder-type') }
  end
end
