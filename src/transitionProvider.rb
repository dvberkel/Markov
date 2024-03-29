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

class LineProvider
	def initialize(lines)
		@lines = lines
		@index = 0
	end
	
	def next
		if (@index < @lines.length) then
			result = @lines[@index]
			@index += 1
			return result
		else
			return nil
		end
	end
end

class FileLineProvider
	def initialize(file)
		@operational = true
		@file = file
	end
	
	def next
		if(@operational) then
			line = @file.gets
			if (line) then
				return line
			else
				@operational = false
			end
		end
		return nil
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

class TransitionProvider
	def initialize(lineProvider, length)
		@lines = lineProvider
		@length = length
		@provider = LineTransitionProvider.new(@lines.next(), @length)
	end
	
	def next
		if (transition = @provider.next()) then
			return transition
		else
			while (@provider.residue.length < @length) do
				break if not line = @lines.next()
				@provider = nextLineTransitionProvider(line, @length, @provider)
			end
			return @provider.next()
		end
	end
	
	private
	def nextLineTransitionProvider(line, length, provider)
		if (line) then
			return LineTransitionProvider.new(line, length, provider)
		else
			return provider
		end
	end
end
