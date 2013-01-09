require_relative '../../../matcher'

describe Matcher do
	before:all do
		@list = ['apple', 'ladle', 'pale', 'ape', 'pail', 'lap']
	end
	describe '#closest_match' do
		it "returns pattern for empty list" do
			pattern = @list.first
			Matcher.closest_match(pattern, []).should eql pattern
		end
		it "returns exact match for member of list" do
			pattern = @list.first
			Matcher.closest_match(pattern, @list).should eql pattern
		end
		it "returns exact for close match" do
			word = 'apple'
			pattern = word.chop
			Matcher.closest_match(pattern, @list).should eql word
		end
		it "returns closest for substring" do
			pattern = 'ap'
			Matcher.closest_match(pattern, @list).should eql 'ape'
		end
		it "returns exact for extra" do
			pattern = 'ilap'
			Matcher.closest_match(pattern, @list).should eql 'lap'
		end
		it "returns exact for single swap" do
			pattern = 'ladel'
			Matcher.closest_match(pattern, @list).should eql 'ladle'
		end
		it "returns first match for multi-word match" do
			pattern = 'ladleape'
			Matcher.closest_match(pattern, @list).should eql 'ladle'
		end
		it "returns exact for spacey words" do
			pattern = 'l a d l e'
			Matcher.closest_match(pattern, @list).should eql 'ladle'
		end
	end
end