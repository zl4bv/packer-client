require 'spec_helper'

describe Packer::Client do
  describe '#build' do
    context 'when no options given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['build', 'template.json'])

        subject.build('template.json')
      end
    end

    context 'when force option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['build', '-force', 'template.json'])

        subject.build('template.json', force: true)
      end
    end

    context 'when except option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['build', '-except=foo,bar', 'template.json'])

        subject.build('template.json', except: %w(foo bar))
      end
    end

    context 'when only option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['build', '-only=foo,bar', 'template.json'])

        subject.build('template.json', only: %w(foo bar))
      end
    end

    context 'when parallel option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['build', '-parallel=false', 'template.json'])

        subject.build('template.json', parallel: false)
      end
    end

    context 'when var_file option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['build', '-var-file=vars.json', 'template.json'])

        subject.build('template.json', var_file: 'vars.json')
      end
    end

    context 'when vars option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['build', "-var 'foo=bar'", 'template.json'])

        subject.build('template.json', vars: { 'foo' => 'bar' })
      end
    end
  end

  describe '#command' do
    let(:shellout) { double('Mixlib::ShellOut') }

    before do
      allow(subject).to receive(:executable_path).and_return('exe')
    end

    it 'executes packer with the given args' do
      expect(Mixlib::ShellOut).to receive(:new).with('exe cmd').and_return(shellout)
      expect(shellout).to receive(:run_command)

      subject.command(['cmd'])
    end
  end

  describe '#executable_path' do
    context 'when Windows' do
      before do
        allow(OS).to receive(:windows?).and_return(true)
      end

      it 'returns packer.exe' do
        expect(subject.executable_path).to eq('packer.exe')
      end
    end

    context 'when Linux' do
      before do
        allow(OS).to receive(:windows?).and_return(false)
      end

      it 'returns packer' do
        expect(subject.executable_path).to eq('packer')
      end
    end
  end

  describe '#executable_path=' do
    before do
      subject.executable_path = '/somewhere/nice'
    end

    it 'sets the executable_path' do
      expect(subject.executable_path).to eq('/somewhere/nice')
    end
  end

  describe '#execution_timeout' do
    it 'returns 7200' do
      expect(subject.execution_timeout).to eq(7200)
    end
  end

  describe '#execution_timeout=' do
    before do
      subject.execution_timeout = 123
    end

    it 'sets the execution_timeout' do
      expect(subject.execution_timeout).to eq(123)
    end
  end

  describe '#fix' do
    it 'returns the fix output'
  end

  describe '#inspect' do
    it 'returns the inspect output'
  end

  describe '#push' do
    it 'returns the push output'
  end

  describe '#validate' do
    it 'returns the validate output'
  end

  describe '#version' do
    it 'returns the Packer version' do
      expect(subject).to receive(:command)
        .with(['version'])
        .and_return(shellout_double('Packer v0.0.0'))

      expect(subject.version).to eq('0.0.0')
    end
  end
end
