require_relative '../../../pokemon'
require_relative '../../populate/parser'

describe Parser do
	before:each do
		@parser = Parser.new
	end

	describe '#parse' do
		it "returns nil if passed nil" do
			@parser.parse(nil).should be_nil
		end
		it "returns nil if passed empty" do
			@parser.parse("").should be_nil
		end
		it "returns nil given string" do
			@parser.parse("wrong").should be_nil
		end
		it "returns array with max number given" do
			@parser.parse(10).count.should eql 10
		end
	end

	describe "#get_pokemon" do
		it "returns empty array when parse has not been called" do
			@parser.get_pokemon.should eql []
		end
		it "returns pokemon with number given to parse" do
			@parser.parse(10)
			@parser.get_pokemon.count.should eql 10
		end
		it "returns pokemon number 16 with correct data" do
			pidgey = @parser.parse(20).select {|x| x.number.to_i == 16}.first
			pidgey.name.should eql "Pidgey"
			pidgey.image.should eql "http://img.pokemondb.net/artwork/pidgey.jpg"
			pidgey.types.should include("Normal")
			pidgey.types.should include("Flying")
		end
		it "returns pokemon number 0 with correct data" do
			missingno = @parser.parse(8).select {|x| x.number.to_i == 0}.first
			missingno.name.should eql "Missingno"
			missingno.image.should eql "images/missingno.png"
			missingno.types.should include("Normal")
			missingno.types.should include("Bird")
		end
		it "returns pokemon number 151 with correct data" do
			mew = @parser.parse(152).last
			mew.name.should eql "Mew"
			mew.image.should eql "http://img.pokemondb.net/artwork/mew.jpg"
			mew.types.count.should eql 1
			mew.types.should include("Psychic")
		end
	end
end
