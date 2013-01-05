require_relative '../../populate/populater'
require_relative '../../../pokemon'
require 'mongoid'

describe Populater do
	before:all do
		Mongoid.load! '../../../mongoid.yml', :test
	end

	before:each do
		@populater = Populater.new
	end

	describe "#new" do
		it "takes no params and returns a Populater instance" do
			@populater.should be_an_instance_of Populater
		end

		it "empties pokemon collection" do
			Pokemon.create!
			Pokemon.count.should eql 1
			Populater.new
			Pokemon.count.should eql 0
		end
	end

	describe "#format_string" do
		it "takes a single integer parameter" do
			expect {@populater.format_string 1}.to_not raise_error
		end

		it "raises error if param is nil" do
			expect {@populater.format_string nil}.to raise_error
		end

		it "raises error if param is not integer" do
			expect {@populater.format_string "500"}.to raise_error
		end

		it "returns 000 for 0" do
			@populater.format_string(0).should eql "000"
		end

		it "returns number padded with zeros for single-digit number" do
			(0..9).each {|x| @populater.format_string(x).should eql "00#{x}"}
		end

		it "returns number padded with zero for two-digit number" do
			x = 35
			@populater.format_string(x).should eql "0#{x}"
		end

		it "returns number as string for three-digit number" do
			x = 456
			@populater.format_string(x).should eql "#{x}"
		end

		it "returns 999 for num with more than three digits" do
			@populater.format_string(3500).should eql "999"
		end
	end

	describe "#add_pokemon" do
		it "takes integer parameter" do
			expect {@populater.add_pokemon 10}.to_not raise_error
		end

		it "raises error given string" do
			expect {@populater.add_pokemon "010"}.to raise_error
		end

		it "raises error given nil" do
			expect {@populater.add_pokemon nil}.to raise_error
		end

		it "adds 0 pokemon given 0" do
			@populater.add_pokemon 0
			Pokemon.count.should eql 0
		end

		it "adds 1 pokemon given 1" do
			@populater.add_pokemon 1
			Pokemon.count.should eql 1
		end

		it "adds 2 pokemon given 2" do
			@populater.add_pokemon 2
			Pokemon.count.should eql 2
		end

		it "adds pokemon with a number" do
			@populater.add_pokemon 1
			Pokemon.count.should eql 1
			Pokemon.first['number'].should_not be_nil
		end

		it "adds pokemon with a name" do
			@populater.add_pokemon 1
			Pokemon.count.should eql 1
			Pokemon.first['name'].should_not be_nil
		end

		it "adds pokemon with array of types" do
			@populater.add_pokemon 1
			Pokemon.count.should eql 1
			types = Pokemon.first['types']
			types.should_not be_nil
			types.should be_an_instance_of Array
			types.should have_at_least(1).items
			types.should have_at_most(2).items
		end

		it "adds pokemon with image link" do
			@populater.add_pokemon 1
			Pokemon.count.should eql 1
			image = Pokemon.first['image']
			image.should_not be_nil
			image.should_not be_empty
		end
	end
end