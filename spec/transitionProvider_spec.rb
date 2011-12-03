require 'transitionProvider'
require 'transition'

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
	
	describe "LineProvider" do
		it "should return consecutive lines" do
			expectedLines = ["abcd", "efgh", "ijkl", nil]
			provider = LineProvider.new(expectedLines)
			
			expectedLines.each do |expected|
				provider.next().should == expected
			end
		end
	end
	
	describe "LineTransitionProvider" do
		it "should take a line and a positive number" do
			provider = LineTransitionProvider.new("", 1)
			
			provider.should_not be(nil)
		end
		
		describe "#next" do
			it "should return nil on empty string" do
				(1..10).each do |length|
					LineTransitionProvider.new("", length).next().should be(nil)
				end
			end
			
			it "given line and length should return sequence and residue" do
				[
					['abc', 1, [Transition.new('a', 'b'), Transition.new('b', 'c'), nil], '', 'c'],
					['abcd', 2, [Transition.new('ab', 'cd'), nil], '', 'cd'],
					['abcd', 3, [nil], 'd', 'abc'],
				].each do |data|
					line = data[0]
					length = data[1]
					expectedSequence = data[2]
					expectedResidue = data[3]
					expectedFrom = data[4]
					
					provider = LineTransitionProvider.new(line, length)
					
					expectedSequence.each do |expected|
						provider.next().should == expected
					end
					provider.residue.should == expectedResidue
					provider.from == expectedFrom
				end
			
			end
		end
		
		it "also should take a line, a positive number and a LineTransitionProvider" do
			exhaust = LineTransitionProvider.new("abcd", 3)
			exhaust.next()
			
			provider = LineTransitionProvider.new("ef", 3, exhaust)
			
			[Transition.new('abc', 'def'), nil].each do |expected|
				provider.next().should == expected
			end
			provider.residue.should == ''
			provider.from == 'def'
		end
	end
end
