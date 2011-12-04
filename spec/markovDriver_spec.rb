require 'markovDriver'

describe "MarkovDriver" do
	before(:each) do
		markov = Markov.new()
		markov.add(Transition.new('a','b'))
		markov.add(Transition.new('b', 'c'))
		markov.add(Transition.new('c', 'a'))
		
		@output = StringOutput.new()
		
		@driver = MarkovDriver.new(markov, @output)
	end	
	
	it "should accept a Markov and an Output" do		
		@driver.should_not be(nil)
	end
	
	it "should produce output" do
		@driver.produce(5)
		
		@output.result.should include("abc")
	end
	
end
