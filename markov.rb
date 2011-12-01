class Markov
	def initialize
		@states = []
	end
	
	def states
		return @states
	end
	
	def add(transition)
		if (not @states.include?(transition.from)) then
			@states.push(transition.from)
		end
		if (not @states.include?(transition.to)) then
			@states.push(transition.to)
		end
	end
end
