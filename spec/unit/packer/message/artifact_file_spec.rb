require 'spec_helper'

describe Packer::Message::ArtifactFile do
  describe '.from_fields' do
    let(:fields) { %w(timestamp target artifact 0 file 0 filename) }

    subject { described_class.from_fields(fields) }

    its(:timestamp) { is_expected.to eq('timestamp') }
    its(:target) { is_expected.to eq('target') }
    its(:type) { is_expected.to eq('artifact') }
    its(:data) { is_expected.to eq(%w(0 file 0 filename)) }
    its(:file_index) { is_expected.to eq('0') }
    its(:filename) { is_expected.to eq('filename') }
  end
end
