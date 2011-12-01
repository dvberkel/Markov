require 'transition'

describe "Transition" do
	before(:each) do
		@expectedFrom = 0
		@expectedTo = 1
		@transition = Transition.new(@expectedFrom, @expectedTo)
	end
	
	describe "#new" do
		it "should create an instance of the Transition class" do
			@transition.should be_an_instance_of Transition
		end
		
		it "should have two arguments" do
			transition = Transition.new(0,1)
		end
	end
	
	describe "#from" do
		it "should return the first constructor argument" do
			from = @transition.from
			
			from.should == @expectedFrom
		end
	end
	
	describe "#to" do
		it "should return the second constructor argument" do
			to = @transition.to
			
			to.should == @expectedTo
		end
	end
	
	describe "#each" do
		it "should accept an block" do
			@transition.each {}
		end
		
		it "should be passed to and from" do
			result = []
			
			@transition.each {|x| result.push(x)}
			
			result.should include(@expectedFrom)
			result.should include(@expectedTo)
		end
	end
end
