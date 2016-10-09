require 'spec_helper'

describe Packer::Output::Build do
  let(:output) do
    "timestamp,virtualbox-iso,artifact-count,1\n" \
    "timestamp,virtualbox-iso,artifact,0,builder-id,mitchellh.post-processor.vagrant\n" \
    "timestamp,virtualbox-iso,artifact,0,id,virtualbox\n" \
    "timestamp,virtualbox-iso,artifact,0,string,'virtualbox' provider box: packer_virtualbox-iso_virtualbox.box\n" \
    "timestamp,virtualbox-iso,artifact,0,files-count,1\n" \
    "timestamp,virtualbox-iso,artifact,0,file,0,packer_virtualbox-iso_virtualbox.box\n" \
    "timestamp,virtualbox-iso,artifact,0,end\n" \
    "timestamp,virtualbox-iso,error,example\n"
  end

  subject { described_class.new(shellout_double(output)) }

  describe '#artifacts' do
    it 'returns an array of artifact messages' do
      expect(subject.artifacts.length).to eq(1)
      expect(subject.artifacts[0].timestamp).to eq('timestamp')
      expect(subject.artifacts[0].target).to eq('virtualbox-iso')
      expect(subject.artifacts[0].type).to eq('artifact')
      expect(subject.artifacts[0].artifact_index).to eq('0')
      expect(subject.artifacts[0].builder_id).to eq('mitchellh.post-processor.vagrant')
      expect(subject.artifacts[0].files.length).to eq(1)
      expect(subject.artifacts[0].files[0].filename).to eq('packer_virtualbox-iso_virtualbox.box')
      expect(subject.artifacts[0].id).to eq('virtualbox')
      expect(subject.artifacts[0].nil).to be_falsey
      expect(subject.artifacts[0].string).to eq("'virtualbox' provider box: packer_virtualbox-iso_virtualbox.box")
    end
  end

  describe '#errors' do
    it 'returns an array of error messages' do
      expect(subject.errors.length).to eq(1)
      expect(subject.errors[0].timestamp).to eq('timestamp')
      expect(subject.errors[0].target).to eq('virtualbox-iso')
      expect(subject.errors[0].type).to eq('error')
      expect(subject.errors[0].error).to eq('example')
    end
  end
end
