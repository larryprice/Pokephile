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
	end

	describe "#populate" do
		it "empties pokemon collection" do
			Pokemon.create
			Pokemon.count.should_not eql 0
			Populater.new.populate 0
			Pokemon.count.should eql 0
		end

		it "adds 0 pokemon given 0" do
			@populater.populate 0
			Pokemon.count.should eql 0
		end

		it "adds 1 pokemon given 1" do
			@populater.populate 1
			Pokemon.count.should eql 1
		end

		it "adds 2 pokemon given 2" do
			@populater.populate 2
			Pokemon.count.should eql 2
		end
	end
end