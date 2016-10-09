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

RSpec::Core::RakeTask.new(:spec)

task default: [:style, :spec]
