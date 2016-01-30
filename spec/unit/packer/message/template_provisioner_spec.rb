require 'spec_helper'

describe Packer::Message::TemplateProvisioner do
  describe '.from_fields' do
    let(:fields) { %w(timestamp target template-provisioner provisioner-name) }

    subject { described_class.from_fields(fields) }

    its(:timestamp) { is_expected.to eq('timestamp') }
    its(:target) { is_expected.to eq('target') }
    its(:type) { is_expected.to eq('template-provisioner') }
    its(:data) { is_expected.to eq(%w(provisioner-name)) }
    its(:name) { is_expected.to eq('provisioner-name') }
  end
end
