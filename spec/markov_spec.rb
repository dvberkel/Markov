require 'markov'

describe "Markov" do
	describe "#new" do
		it "creates an instance of the Markov class" do
			book = Markov.new
			book.should be_an_instance_of Markov
		end
	end
end
