$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'packer'

require 'rspec/its'

def shellout_double(stdout, stderr = '', exitstatus = 0)
  double('Mixlib::ShellOut', stdout: stdout, stderr: stderr, exitstatus: exitstatus)
end
