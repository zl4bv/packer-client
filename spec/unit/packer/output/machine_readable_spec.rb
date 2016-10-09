require 'spec_helper'

describe Packer::Output::MachineReadable do
  describe '#ui_messages' do
    let(:output) { 'timestamp,,ui,say,example' }

    subject { described_class.new(shellout_double(output)) }

    it 'returns an array of UI messages' do
      expect(subject.ui_messages.length).to eq(1)
      expect(subject.ui_messages[0].timestamp).to eq('timestamp')
      expect(subject.ui_messages[0].target).to be_nil
      expect(subject.ui_messages[0].type).to eq('ui')
      expect(subject.ui_messages[0].ui_message_type).to eq('say')
      expect(subject.ui_messages[0].output).to eq('example')
    end
  end
end
