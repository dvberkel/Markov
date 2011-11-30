class Markov
	def initialize
		@states = []
	end
	
	def states
		return @states
	end
	
	def add(transition)
		@states.push(0,1)
	end
end
