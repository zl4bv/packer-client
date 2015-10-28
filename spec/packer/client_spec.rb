require 'spec_helper'

describe Packer::Client do
  describe '.build' do
    it 'executes packer build'
  end

  describe '.executable_path' do
    subject { Packer::Client.executable_path }

    context 'when executable path is not set' do
      context 'when platform is Windows' do
        before do
          allow(OS).to receive(:windows?).and_return(true)
        end

        it 'gets the default executable path for Windows' do
          is_expected.to eq('packer.exe')
        end
      end

      context 'when platform is not Windows' do
        before do
          allow(OS).to receive(:windows?).and_return(false)
        end

        it 'gets the default executable path for non-Windows' do
          is_expected.to eq('packer')
        end
      end
    end

    context 'when executable path is set' do
      before do
        Packer::Client.executable_path = 'example1'
      end

      it 'gets the default executable path' do
        is_expected.to eq('example1')
      end
    end
  end

  describe '.executable_path=' do
    subject { Packer::Client.executable_path = 'example2' }

    it 'returns the new executable path' do
      is_expected.to eq('example2')
    end

    it 'sets the executable path' do
      expect(Packer::Client.executable_path).to eq('example2')
    end
  end

  describe '.execution_timeout' do
    subject { Packer::Client.execution_timeout }

    context 'when execution timeout is not set' do
      it 'gets the default execution timeout' do
        is_expected.to eq(7200)
      end
    end

    context 'when execution timeout is set' do
      before do
        Packer::Client.execution_timeout = 1234
      end

      it 'gets the defined execution timeout' do
        is_expected.to eq(1234)
      end
    end
  end

  describe '.execution_timeout=' do
    subject { Packer::Client.execution_timeout = 5678}

    it 'returns the new execution timeout' do
      is_expected.to eq(5678)
    end

    it 'sets the execution timeout' do
      expect(Packer::Client.execution_timeout).to eq(5678)
    end
  end

  describe '.fix' do
    it 'executes packer fix'
  end

  describe '.inspect' do
    it 'executes packer inspect'
  end

  describe '.push' do
    it 'executes packer push'
  end

  describe '.validate' do
    it 'executes packer validate'
  end

  describe '.version' do
    it 'executes packer version'
  end
end
