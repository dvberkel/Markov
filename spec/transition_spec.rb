require 'transition'

describe "Transition" do
	describe "#new" do
		it "should create an instance of the Transition class" do
			transition = Transition.new(0,1)
			transition.should be_an_instance_of Transition
		end
		
		it "should have two arguments" do
			transition = Transition.new(0,1)
		end
	end
	
	describe "#from" do
		it "should return the first constructor argument" do
			expected = 0
			transition = Transition.new(expected,1)
			
			from = transition.from
			
			from.should == expected
		end
	end
	
	describe "#to" do
		it "should return the second constructor argument" do
			expected = 1
			transition = Transition.new(0,expected)
			
			to = transition.to
			
			to.should == expected
		end
	end
end
