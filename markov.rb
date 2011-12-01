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
	
	def apply(element, numberOf = 1)
		numberOf.times do
			element = transition(element)
		end
		return element
	end
	
	private
	def transition(element)
		if (@stateTransitions.include?(element) and not @stateTransitions[element].empty?) then
			return @stateTransitions[element][0].to
		else
			return nil
		end
	end
end
