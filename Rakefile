require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

namespace :style do
  RuboCop::RakeTask.new(:rubocop) do |t|
    t.options = ['--fail-level', 'warning']
  end
end

desc 'Run all style checks'
task style: ['style:rubocop']

namespace :spec do
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = 'spec/unit/**/*_spec.rb'
  end

  RSpec::Core::RakeTask.new(:integration) do |t|
    t.pattern = 'spec/integration/**/*_spec.rb'
  end

  # Note you must have Packer installed to run the system tests
  RSpec::Core::RakeTask.new(:system) do |t|
    t.pattern = 'spec/system/**/*_spec.rb'
  end
end

task default: [:style, 'spec:unit', 'spec:integration']
