$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'packer'

def shellout_double(stdout, stderr = '')
  double('Mixlib::ShellOut', stdout: stdout, stderr: stderr)
end
