require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'
require 'markov'
require 'transitionProvider'
require 'markovDriver'

inputFile = 'resource/alice_in_wonderland.txt'
strippedFile = 'resource/alice.txt'
markovFile = 'resource/markov.data'
outputFile = 'resource/output.txt'
markov = nil

desc "Create Alice in Wonderland file without Gutenberg banner"
file strippedFile do |t|
	puts "Creating " + strippedFile
	File.open(strippedFile, "w") do |out|
		output = false
		File.open(inputFile) do |file|
			while line = file.gets
				output = false if (line =~ /^\*{3} END/)
				if (output and not line =~ /^\s*$/) then
					out.puts line
				end
				output = true if (line =~ /^\*{3} START[^:]/)
			end
		end
	end
end

desc "Marshal an Markov chain"
file markovFile => [strippedFile] do
	File.open(strippedFile) do |inFile|
		puts "Creating a Markov chain"
		m = Markov.create(FileLineProvider.new(inFile), 5)
		puts "Marshalling Markov chain"
		File.open(markovFile, 'w') do |outFile|
			Marshal.dump(m, outFile)
		end
	end
end

desc "Unmarshal an Markov chain"
task :unmarshal => [markovFile] do
	puts "Unmarshalling Markov chain"
	File.open(markovFile) do |inFile|
		markov = Marshal.load(inFile)
	end
end

desc "Create an example text from Alice in Wonderland"
task :create => [:unmarshal] do
	puts "Writing output"
	File.open(outputFile, 'w') do |outFile|
		driver = MarkovDriver.new(markov,FileOutput.new(outFile))
		driver.produce(500)
	end
end

desc "Run rspec on the spec directory"
RSpec::Core::RakeTask.new('rspec') do |t|
	t.rspec_opts = ['-I src']
	t.pattern = 'spec/**/*_spec.rb'
end

desc "Clean project from created artifacts"
task :clean do
	[strippedFile, outputFile, markovFile].each do |fileName|
		if (File.exists?(fileName)) then
			puts "Removing " + fileName
			File.delete(fileName)
		end
	end
end

task :default => [:rspec]
