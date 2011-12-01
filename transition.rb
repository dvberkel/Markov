class Transition
	def initialize(from, to)
		@from = from
		@to = to
	end
	
	def from
		return @from
	end
	
	def to
		return @to
	end
	
	def each
		[@from, @to].each {|element| yield(element)}
	end
end
