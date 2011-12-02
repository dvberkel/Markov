require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'

inputFile = 'resource/alice_in_wonderland.txt'
strippedFile = 'resource/alice.txt'

desc "Create Alice in Wonderland file without Gutenberg banner"
file strippedFile do |t|
	puts "Creating " + strippedFile
	File.open(strippedFile, "w") do |out|
		output = false
		File.open(inputFile) do |file|
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
task :create => [strippedFile] do 
	puts "Hello World"
end

desc "Run rspec on the spec directory"
RSpec::Core::RakeTask.new('rspec') do |t|
	t.rspec_opts = ['-I src']
	t.pattern = 'spec/**/*_spec.rb'
end

desc "Clean project from created artifacts"
task :clean do
	[strippedFile].each do |fileName|
		if (File.exists?(fileName)) then
			puts "Removing " + fileName
			File.delete(fileName)
		end
	end
end

task :default => [:rspec]
