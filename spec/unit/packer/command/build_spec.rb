require 'spec_helper'


describe Packer::Command::Build do
  let(:output) do
    "timestamp,virtualbox-iso,artifact-count,1\n" \
    "timestamp,virtualbox-iso,artifact,0,builder-id,mitchellh.post-processor.vagrant\n" \
    "timestamp,,error-count,1\n" \
    "timestamp,virtualbox-iso,error,example\n"
  end

  subject { described_class.new(shellout_double(output)) }

  describe '#artifacts' do

  end

  describe '#artifact_count' do
    its(:artifact_count) { is_expected.to eq('1') }
  end

  describe '#errors' do

  end

  describe '#error_count' do
    context 'when there is 1 error' do
      its(:error_count) { is_expected.to eq('1') }
    end

    context 'when there are no errors' do
      let(:output) { "timestamp,,error-count,0\n" }

      its(:error_count) { is_expected.to eq('0') }
    end
  end
end
