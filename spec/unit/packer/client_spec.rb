require 'spec_helper'

describe Packer::Client do
  describe '#build' do
    context 'when no options given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['build', '-machine-readable', 'template.json'])

        subject.build('template.json')
      end
    end

    context 'when force option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['build', '-machine-readable', '-force', 'template.json'])

        subject.build('template.json', force: true)
      end
    end

    context 'when except option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['build', '-machine-readable', '-except=foo,bar', 'template.json'])

        subject.build('template.json', except: %w(foo bar))
      end
    end

    context 'when only option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['build', '-machine-readable', '-only=foo,bar', 'template.json'])

        subject.build('template.json', only: %w(foo bar))
      end
    end

    context 'when parallel option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['build', '-machine-readable', '-parallel=false', 'template.json'])

        subject.build('template.json', parallel: false)
      end
    end

    context 'when var_file option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['build', '-machine-readable', '-var-file=vars.json', 'template.json'])

        subject.build('template.json', var_file: 'vars.json')
      end
    end

    context 'when vars option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['build', '-machine-readable', "-var 'foo=bar'", 'template.json'])

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
      expect(Mixlib::ShellOut).to receive(:new)
        .with('exe cmd', timeout: 7200)
        .and_return(shellout)
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
    it 'executes Packer with correct arguments' do
      expect(subject).to receive(:command)
        .with(['fix', 'template.json'])

      subject.fix('template.json')
    end
  end

  describe '#packer_inspect' do
    it 'executes Packer with correct arguments' do
      expect(subject).to receive(:command)
        .with(['inspect', '-machine-readable', 'template.json'])

      subject.packer_inspect('template.json')
    end
  end

  describe '#push' do
    context 'when no options given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['push', 'template.json'])

        subject.push('template.json')
      end
    end

    context 'when message option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['push', '-message=foo', 'template.json'])

        subject.push('template.json', message: 'foo')
      end
    end

    context 'when name option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['push', '-name=foo/bar', 'template.json'])

        subject.push('template.json', name: 'foo/bar')
      end
    end

    context 'when token option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['push', '-token=example', 'template.json'])

        subject.push('template.json', token: 'example')
      end
    end

    context 'when var_file option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['push', '-var-file=vars.json', 'template.json'])

        subject.push('template.json', var_file: 'vars.json')
      end
    end

    context 'when vars option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['push', "-var 'foo=bar'", 'template.json'])

        subject.push('template.json', vars: { 'foo' => 'bar' })
      end
    end
  end

  describe '#validate' do
    context 'when no options given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['validate', 'template.json'])

        subject.validate('template.json')
      end
    end

    context 'when syntax_only option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['validate', '-syntax-only', 'template.json'])

        subject.validate('template.json', syntax_only: true)
      end
    end

    context 'when except option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['validate', '-except=foo,bar', 'template.json'])

        subject.validate('template.json', except: %w(foo bar))
      end
    end

    context 'when only option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['validate', '-only=foo,bar', 'template.json'])

        subject.validate('template.json', only: %w(foo bar))
      end
    end

    context 'when var_file option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['validate', '-var-file=vars.json', 'template.json'])

        subject.validate('template.json', var_file: 'vars.json')
      end
    end

    context 'when vars option given' do
      it 'executes Packer with correct arguments' do
        expect(subject).to receive(:command)
          .with(['validate', "-var 'foo=bar'", 'template.json'])

        subject.validate('template.json', vars: { 'foo' => 'bar' })
      end
    end
  end

  describe '#version' do
    it 'executes Packer with the correct arguments' do
      expect(subject).to receive(:command)
        .with(['version', '-machine-readable'])

      subject.version
    end
  end
end
