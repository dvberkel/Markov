require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'

desc "Run rspec on the spec directory"
RSpec::Core::RakeTask.new('rspec') do |t|
	t.rspec_opts = ['-I src']
	t.pattern = 'spec/**/*_spec.rb'
end

task :default => [:rspec]
