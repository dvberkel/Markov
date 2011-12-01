require 'markov'
require 'transition'

describe "Markov" do
	describe "#new" do
		it "creates an instance of the Markov class" do
			(Markov.new).should be_an_instance_of Markov
		end
	end
	
	describe "states" do
		before(:each) do
			@markov = Markov.new
		end
		
		describe "initially" do
			it "should have no elements" do
				@markov.should have(0).states
			end
		end
		
		describe "after adding a transition" do
			it "should have 2 elements" do
				transition = Transition.new(0,1)
				
				@markov.add(transition)
				
				@markov.should have(2).states
			end
		end
		
		describe "after adding a transition twice" do
			it "should still have 2 elements" do
				transition = Transition.new(0,1)
				
				@markov.add(transition)
				@markov.add(transition)
				
				@markov.should have(2).states
			end
		end
	end
end
