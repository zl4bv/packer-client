require 'spec_helper'

def mock_shellout(cmd, stdout)
  shellout = double('Mixlib::Shellout')

  allow(OS).to receive(:windows?).and_return(false)
  allow(Mixlib::ShellOut).to receive(:new).with(cmd, timeout: 7200).and_return(shellout)
  allow(shellout).to receive(:run_command).and_return(shellout)
  allow(shellout).to receive(:stdout).and_return(stdout)
end

describe 'build' do
  subject { Packer::Client.new }

  describe 'null builder' do
    let(:template) { File.expand_path('../../fixtures/null_builder.json', __FILE__) }
    let(:stdout) { File.expand_path('../../fixtures/null_builder.log', __FILE__) }

    before do
      mock_shellout("packer build -machine-readable #{template}", stdout)
    end

    it 'returns build output' do
      expect(subject.build(template)).to be_a(Packer::Output::Build)
    end

    it 'returns the correct messages from the output' do
      output = subject.build(template)
      expect(output.artifacts).to be_empty
      expect(output.errors).to be_empty
    end
  end
end
