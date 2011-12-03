require 'prng'

describe "Pseudo Random Number Generator" do
	describe "rand" do
		before(:each) do
			@generator = Prng.new
		end

		it "should return consecutive integers" do
			@generator.mrand().should be(0)
			@generator.mrand().should be(1)
			@generator.mrand().should be(2)
			@generator.mrand().should be(3)
		end
	end
	
	describe "rand(limit)" do
		before(:each) do
			@generator = Prng.new(0)
		end

		it "should return consecutive integers modulo limit" do
			@generator.mrand(2).should be(1)
			@generator.mrand(2).should be(0)
			@generator.mrand(2).should be(1)
			@generator.mrand(2).should be(0)
		end
		
	end
end
