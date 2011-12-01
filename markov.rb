class Markov
	def initialize
		@stateTransitions = {}
	end
	
	def states
		return @stateTransitions.keys
	end
	
	def add(transition)
		if (not @stateTransitions.keys.include?(transition.from)) then
			@stateTransitions[transition.from] = []
		end
		if (not @stateTransitions.keys.include?(transition.to)) then
			@stateTransitions[transition.to] = []
		end
	end
end
