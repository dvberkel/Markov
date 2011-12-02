class LineTransitionProvider
	def initialize(line, length)
		@line = line
		@length = length
		@index = 0
	end
	
	def next
		if (@index + @length - 1 < @line.length) then
			result = @line[@index .. (@index + @length - 1)]
			@index += @length
			return result
		else 
			return nil
		end
	end
end
