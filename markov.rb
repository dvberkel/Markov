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
	end
end
