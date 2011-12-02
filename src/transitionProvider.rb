require 'transition'

class LineSplitter
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
	
	def residue
		return @line[@index .. @line.size]
	end
end

class LineTransitionProvider
	def initialize(line, length, provider = nil)
		if (provider)
			@splitter = LineSplitter.new(provider.residue + line, length)
			@from = provider.from
			@to = @splitter.next();
		else
			@splitter = LineSplitter.new(line, length)
			@from = @splitter.next()
			@to = @splitter. next()
		end
	end
	
	def next
		if (@from != nil and @to != nil) then
			transition = Transition.new(@from, @to)
			@from, @to = @to, @splitter.next()
			return transition
		else 
			return nil
		end
	end
	
	def residue
		return @splitter.residue
	end
	
	def from
		return @from
	end
end
