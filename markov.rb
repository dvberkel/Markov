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
			if (@stateTransitions.include?(element)) then
				if (not @stateTransitions[element].empty?) then
					element = @stateTransitions[element][0].to
				else 
					element = nil
				end
			else
				element = nil
			end
		end
		return element
	end
end
