require 'transitionProvider'

describe "TransitionProvider" do
	describe "LineSplitter" do
		it "should take a line and a positive number" do
			provider = LineSplitter.new("", 1)
			
			provider.should_not be(nil)
		end
		
		describe "#next" do
			it "should return nil on empty string" do
				(1..10).each do |length|
					LineSplitter.new("", length).next().should be(nil)
				end
			end
			
			it "should return 'a, b, c, d, nil' on input 'abcd', 1" do
				[
					['abcd', 1, ['a', 'b', 'c', 'd', nil]],
					['abcd', 2, ['ab', 'cd', nil]],
					['abcd', 3, ['abc', nil]]
				].each do |data|
					line = data[0]
					length = data[1]
					expectedSequence = data[2]
					
					provider = LineSplitter.new(line, length)
					
					expectedSequence.each do |expected|
						provider.next().should == expected
					end
				end
			end
		end
	end
end
