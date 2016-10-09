require 'spec_helper'

describe Packer::Command::Version do
  let(:output) do
    "timestamp,,version,0.0.0\n" \
    "timestamp,,version-prelease,alpha\n" \
    "timestamp,,version-commit,abcdef0123456789+CHANGES\n" \
    "timestamp,,ui,say,Packer v0.0.0\n" \
    "timestamp,,ui,say,\n"
  end

  subject { described_class.new(shellout_double(output)) }

  describe '#version' do
    its(:version) { is_expected.to eq('0.0.0') }
  end

  describe '#version_commit' do
    its(:version_commit) { is_expected.to eq('abcdef0123456789+CHANGES') }
  end

  describe '#version_prerelease' do
    context 'when there is a prerelease' do
      its(:version_prerelease) { is_expected.to eq('alpha') }
    end

    context 'when there is not a prerelease' do
      let(:output) { "timestamp,,version-prelease,\n" }

      its(:version_prerelease) { is_expected.to be_nil }
    end
  end
end
