require 'markov'

describe "Markov" do
	describe "#new" do
		it "creates an instance of the Markov class" do
			markov = Markov.new
			markov.should be_an_instance_of Markov
		end
	end
	
	describe "states" do
		describe "initially" do
			it "returns nothing" do
				markov = Markov.new
				markov.should have(0).states
			end
		end
	end
end
