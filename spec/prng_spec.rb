require 'prng'

describe "Pseudo Random Number Generator" do
	describe "rand" do
		before(:each) do
			@generator = Prng.new
		end

		it "should return consecutive integers" do
			@generator.rand().should be(0)
			@generator.rand().should be(1)
			@generator.rand().should be(2)
			@generator.rand().should be(3)
		end
	end
	
	describe "rand(limit)" do
		before(:each) do
			@generator = Prng.new(0)
		end

		it "should return consecutive integers modulo limit" do
			@generator.rand(2).should be(1)
			@generator.rand(2).should be(0)
			@generator.rand(2).should be(1)
			@generator.rand(2).should be(0)
		end
		
	end
end
