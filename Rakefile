require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'

desc "Create Alice in Wonderland file without Gutenberg banner"
file "resource/alice.txt" do |t|
	puts "Creating alice.txt"
	File.open("resource/alice.txt", "w") do |out|
		output = false
		File.open("resource/alice_in_wonderland.txt") do |file|
			while line = file.gets
				output = false if (line =~ /^\*{3} END/)
				if (output) then
					out.puts line
				end
				output = true if (line =~ /^\*{3} START[^:]/)
			end
		end
	end
end

desc "Create an example text from Alice in Wonderland"
task :create => ["resource/alice.txt"] do 
	puts "Hello World"
end

desc "Run rspec on the spec directory"
RSpec::Core::RakeTask.new('rspec') do |t|
	t.rspec_opts = ['-I src']
	t.pattern = 'spec/**/*_spec.rb'
end

desc "Clean project from created artifacts"
task :clean do
	['resource/alice.txt'].each do |fileName|
		if (File.exists?(fileName)) then
			puts "Removing " + fileName
			File.delete(fileName)
		end
	end
end

task :default => [:rspec]
