require 'markov'
require 'transition'
require 'prng'

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
			@markov = Markov.new(Prng.new)
		end
		
		describe "after adding a transition with from an to" do
			it "should return to when given from" do
				@markov.add(Transition.new(0,1))
			
				result = @markov.apply(0)
			
				result.should be(1)
			end
		end

		describe "starting element" do
			describe "is not a state" do
				it "should return nil" do
					result = @markov.apply(0)
				
					result.should be(nil)
				end
			end
		
			describe "is not a from state" do
				it "should return nil" do
					@markov.add(Transition.new(0,1))
				
					result = @markov.apply(1)
				
					result.should be(nil)
				end
			end
		end
		
		describe "multiple times" do
			describe "consecutive transitions" do
				it "should return last to element" do
					@markov.add(Transition.new(0,1))
					@markov.add(Transition.new(1,2))
					
					result = @markov.apply(0,2)
					
					result.should be(2)
				end
			end
		end
		
		describe "probabilistic aspect" do
			describe "transitions with same from element" do
				it "should be returned with equal probability" do
					expectedNumber = 5
					numberOfTransitions = 2
					count = {}
					(1..numberOfTransitions).each {|i|
						@markov.add(Transition.new(0,i))
					}
					
					(numberOfTransitions * expectedNumber).times do
						result = @markov.apply(0)
						if (not count.keys.include?(result)) then
							count[result] = 0
						end
						count[result] += 1
					end
										
					count.keys.each {|key|
						count[key].should be(expectedNumber)
					}
				end
			end
		end
	end
end 
