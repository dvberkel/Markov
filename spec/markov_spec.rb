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
		
		describe "after adding 2 disjunct transitions" do
			it "should have 4 elements" do
				thisTransition = Transition.new(0,1)
				thatTransition = Transition.new(2,3)
				
				@markov.add(thisTransition)
				@markov.add(thatTransition)
				
				@markov.should have(4).states
			end
		end
		
		describe "after adding 2 transitions with an element in common" do
			it "should have 3 elements" do
				thisTransition = Transition.new(0,1)
				thatTransition = Transition.new(1,2)
				
				@markov.add(thisTransition)
				@markov.add(thatTransition)
				
				@markov.should have(3).states
			end
		end
		
		describe "after adding a transition with from and to" do
			it "should have corresponding elements" do
				transition = Transition.new(0,1)
				
				@markov.add(transition)
				
				@markov.states.should include(0,1)
			end
		end
	end
	
	describe "#apply" do
		before(:each) do
			@markov = Markov.new
		end
		
		describe "after adding a transition with from an to" do
			it "should return to when given from" do
				@markov.add(Transition.new(0,1))
				
				result = @markov.apply(0)
				
				result.should be(1)
			end
		end
	end
end
