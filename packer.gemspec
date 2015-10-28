# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'packer/version'

Gem::Specification.new do |spec|
  spec.name          = 'packer'
  spec.version       = Packer::VERSION
  spec.authors       = ['Ben Vidulich']
  spec.email         = ['ben@vidulich.co.nz']

  spec.summary       = %q{A Ruby client for HashiCorp's Packer tool.}
  spec.description   = %q{A Ruby client for HashiCorp's Packer tool.}
  spec.homepage      = 'https://github.com/zl4bv/packer-ruby'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'

  spec.add_runtime_dependency 'mixlib-shellout', '~> 2.2'
  spec.add_runtime_dependency 'os', '~> 0.9'
end
