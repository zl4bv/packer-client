require 'spec_helper'

describe 'build' do
  subject { Packer::Client.new }

  describe 'null builder' do
    let(:template) { File.expand_path('../../fixtures/null_builder.json', __FILE__) }

    it 'returns build output' do
      expect(subject.build(template)).to be_a(Packer::Output::Build)
    end

    it 'returns the correct messages from the output' do
      output = subject.build(template)
      expect(output.artifacts).to be_one
      expect(output.errors).to be_empty
    end
  end
end
