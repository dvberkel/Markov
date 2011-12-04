class MarkovDriver
	def initialize(markov, output)
		@markov = markov
		@output = output
		@currentState = nil
	end
	
	def produce(numberOfStates)
		if (not @currentState) then
			@currentState = @markov.states[0]
		end
		numberOfStates.times do
			@output.puts(@currentState)
			@currentState = @markov.apply(@currentState)
		end
	end
end

class StringOutput
	def initialize
		@result = ""
	end
	
	def puts(value)
		@result += value
	end
	
	def result
		return @result
	end
end
