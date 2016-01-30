require 'spec_helper'

describe Packer::Message::TemplateVariable do
  describe '.from_fields' do
    let(:fields) { %w(timestamp target template-variable varname defaultval true) }

    subject { described_class.from_fields(fields) }

    its(:timestamp) { is_expected.to eq('timestamp') }
    its(:target) { is_expected.to eq('target') }
    its(:type) { is_expected.to eq('template-variable') }
    its(:data) { is_expected.to eq(%w(varname defaultval true)) }
    its(:name) { is_expected.to eq('varname') }
    its(:default) { is_expected.to eq('defaultval') }
    its(:required) { is_expected.to eq('true') }
  end
end
