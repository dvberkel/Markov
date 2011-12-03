class Prng
	def initialize(seed = -1)
		@seed = seed
	end
	
	
	def mrand(limit = nil)
		@seed += 1
		if (limit) then
			return @seed % limit
		else 
			return @seed
		end
	end
end

class RPrng < Prng
	def mrand(limit = 2)
		return rand(limit)
	end
end
