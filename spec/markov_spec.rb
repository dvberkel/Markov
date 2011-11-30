require 'markov'
require 'transition'

describe "Markov" do
	describe "#new" do
		it "creates an instance of the Markov class" do
			markov = Markov.new
			markov.should be_an_instance_of Markov
		end
	end
	
	describe "states" do
		describe "initially" do
			it "should have no elements" do
				markov = Markov.new
				markov.should have(0).states
			end
		end
		
		describe "after adding a transition" do
			it "should have 2 elements" do
				markov = Markov.new
				transition = Transition.new
				
				markov.add(transition)
				
				markov.should have(2).states
			end
		end
	end
end
