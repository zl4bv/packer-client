require 'spec_helper'

describe Packer::Command::Inspect do
  let(:output) do
    "timestamp,,template-variable,foo,bar,0\n" \
    "timestamp,,template-builder,virtualbox-iso,virtualbox-iso\n" \
    "timestamp,,template-provisioner,shell\n" \
  end

  subject { described_class.new(shellout_double(output)) }

  describe '#template_variables' do
    it 'returns an array of template-variable messages' do
      expect(subject.template_variables.length).to eq(1)
      expect(subject.template_variables[0].name).to eq('foo')
      expect(subject.template_variables[0].default).to eq('bar')
      expect(subject.template_variables[0].required).to eq('0')
    end
  end

  describe '#template_builders' do
    it 'returns an array of template-builder messages' do
      expect(subject.template_builders.length).to eq(1)
      expect(subject.template_builders[0].name).to eq('virtualbox-iso')
      expect(subject.template_builders[0].builder_type).to eq('virtualbox-iso')
    end
  end

  describe '#template_provisioners' do
    it 'returns an array of template-provisioner messages' do
      expect(subject.template_provisioners.length).to eq(1)
      expect(subject.template_provisioners[0].name).to eq('shell')
    end
  end
end
