require 'prng'

class Markov
	def self.create(lineProvider, length)
		markov = Markov.new
		
		provider = TransitionProvider.new(lineProvider, length)
		while (transition = provider.next())
			markov.add(transition)
		end
		
		return markov
	end
	
	def initialize(prng = RPrng.new)
		@stateTransitions = {}
		@prng = prng
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
			index = @prng.mrand(@stateTransitions[element].length)
			return @stateTransitions[element][index].to
		else
			return nil
		end
	end
end
