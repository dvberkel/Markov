require 'markov'

describe "Probe Marshalling of Markov objects" do
	it "should marshall object" do
		markov = Markov.new()
		markov.add(Transition.new('0','1'))
		
		data = Marshal.dump(markov)
		clone = Marshal.load(data)
		
		clone.should have(2).states
	end
end
