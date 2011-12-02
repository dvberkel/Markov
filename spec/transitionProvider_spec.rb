require 'transitionProvider'

describe "TransitionProvider" do
	describe "LineSplitter" do
		it "should take a line and a positive number" do
			splitter = LineSplitter.new("", 1)
			
			splitter.should_not be(nil)
		end
		
		describe "#next" do
			it "should return nil on empty string" do
				(1..10).each do |length|
					LineSplitter.new("", length).next().should be(nil)
				end
			end
			
			it "given line and length should return sequence and residue" do
				[
					['abcd', 1, ['a', 'b', 'c', 'd', nil], ''],
					['abcd', 2, ['ab', 'cd', nil], ''],
					['abcd', 3, ['abc', nil], 'd']
				].each do |data|
					line = data[0]
					length = data[1]
					expectedSequence = data[2]
					expectedResidue = data[3]
					
					splitter = LineSplitter.new(line, length)
					
					expectedSequence.each do |expected|
						splitter.next().should == expected
					end
					splitter.residue.should == expectedResidue
				end
			end
		end
	end
end
