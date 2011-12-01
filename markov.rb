class Markov
	def initialize
		@stateTransitions = {}
	end
	
	def states
		return @stateTransitions.keys
	end
	
	def add(transition)
		transition.each { |element|
			if (not @stateTransitions.keys.include?(element)) then
				@stateTransitions[element] = []
			end
		}
		@stateTransitions[transition.from].push(transition)
	end
	
	def apply(element)
		return @stateTransitions[element][0].to
	end
end
