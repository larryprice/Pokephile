require_relative '../../populate/type_builder'
require_relative '../../../models/type'

describe TypeBuilder do
	before:all do
		Mongoid.load! '../../../mongoid.yml', :test
	end
	before:each do
		Type.delete_all
		@builder = TypeBuilder.new
	end

	describe "#build_normal" do
		it "creates normal document with correct not very" do
			@builder.build_normal
			normal = Type.first
			normal.should_not be_nil
			normal.name.should eql "Normal"

			normal.not_very.should include("Rock", "Steel")
		end

		it "creates normal document with correct no effect" do
			@builder.build_normal
			normal = Type.first
			normal.should_not be_nil
			normal.name.should eql "Normal"

			normal.no_effect.should include("Ghost")
		end
	end

	describe "#build_fire" do
		it "creates fire document with correct not very" do
			@builder.build_fire
			fire = Type.first
			fire.should_not be_nil
			fire.name.should eql "Fire"

			fire.not_very.should include("Fire", "Water", "Rock", "Dragon")
		end

		it "creates fire document with correct super" do
			@builder.build_fire
			fire = Type.first
			fire.should_not be_nil
			fire.name.should eql "Fire"

			fire.super.should include("Grass", "Ice", "Bug", "Steel")
		end
	end

	describe "#build_water" do
		it "creates water document with correct not very" do
			@builder.build_water
			water = Type.first
			water.should_not be_nil
			water.name.should eql "Water"

			water.not_very.should include("Water", "Grass", "Dragon")
		end

		it "creates water document with correct super" do
			@builder.build_water
			water = Type.first
			water.should_not be_nil
			water.name.should eql "Water"

			water.super.should include("Fire", "Ground", "Rock")
		end
	end

	describe "#build_electric" do
		it "creates electric document with correct not very" do
			@builder.build_electric
			electric = Type.first
			electric.should_not be_nil
			electric.name.should eql "Electric"

			electric.not_very.should include("Electric", "Grass", "Dragon")
		end

		it "creates electric document with correct no effect" do
			@builder.build_electric
			electric = Type.first
			electric.should_not be_nil
			electric.name.should eql "Electric"

			electric.no_effect.should include("Ground")
		end

		it "creates electric document with correct super" do
			@builder.build_electric
			electric = Type.first
			electric.should_not be_nil
			electric.name.should eql "Electric"

			electric.super.should include("Water", "Flying")
		end
	end

	describe "#build_grass" do
		it "creates grass document with correct not very" do
			@builder.build_grass
			grass = Type.first
			grass.should_not be_nil
			grass.name.should eql "Grass"

			grass.not_very.should include("Fire", "Grass", "Poison", "Flying", "Bug", "Dragon", "Steel")
		end

		it "creates grass document with correct super" do
			@builder.build_grass
			grass = Type.first
			grass.should_not be_nil
			grass.name.should eql "Grass"

			grass.super.should include("Water", "Ground", "Rock")
		end
	end

	describe "#build_ice" do
		it "creates ice document with correct not very" do
			@builder.build_ice
			ice = Type.first
			ice.should_not be_nil
			ice.name.should eql "Ice"

			ice.not_very.should include("Fire", "Water", "Ice", "Steel")
		end

		it "creates ice document with correct super" do
			@builder.build_ice
			ice = Type.first
			ice.should_not be_nil
			ice.name.should eql "Ice"

			ice.super.should include("Grass", "Ground", "Flying", "Dragon")
		end
	end

	describe "#build_fighting" do
		it "creates fighting document with correct not very" do
			@builder.build_fighting
			fighting = Type.first
			fighting.should_not be_nil
			fighting.name.should eql "Fighting"

			fighting.not_very.should include("Poison", "Flying", "Psychic", "Bug")
		end

		it "creates fighting document with correct super" do
			@builder.build_fighting
			fighting = Type.first
			fighting.should_not be_nil
			fighting.name.should eql "Fighting"

			fighting.super.should include("Normal", "Ice", "Rock", "Dark", "Steel")
		end

		it "creates fighting document with correct no effect" do
			@builder.build_fighting
			fighting = Type.first
			fighting.should_not be_nil
			fighting.name.should eql "Fighting"

			fighting.no_effect.should include("Ghost")
		end
	end

	describe "#build_poison" do
		it "creates poison document with correct not very" do
			@builder.build_poison
			poison = Type.first
			poison.should_not be_nil
			poison.name.should eql "Poison"

			poison.not_very.should include("Poison", "Ground", "Rock", "Ghost")
		end

		it "creates poison document with correct super" do
			@builder.build_poison
			poison = Type.first
			poison.should_not be_nil
			poison.name.should eql "Poison"

			poison.super.should include("Grass")
		end

		it "creates poison document with correct no effect" do
			@builder.build_poison
			poison = Type.first
			poison.should_not be_nil
			poison.name.should eql "Poison"

			poison.no_effect.should include("Steel")
		end
	end

	describe "#build_ground" do
		it "creates ground document with correct not very" do
			@builder.build_ground
			ground = Type.first
			ground.should_not be_nil
			ground.name.should eql "Ground"

			ground.not_very.should include("Grass", "Bug")
		end

		it "creates ground document with correct super" do
			@builder.build_ground
			ground = Type.first
			ground.should_not be_nil
			ground.name.should eql "Ground"

			ground.super.should include("Fire", "Electric", "Fighting", "Rock", "Steel")
		end

		it "creates ground document with correct no effect" do
			@builder.build_ground
			ground = Type.first
			ground.should_not be_nil
			ground.name.should eql "Ground"

			ground.no_effect.should include("Flying")
		end
	end

	describe "#build_flying" do
		it "creates flying document with correct not very" do
			@builder.build_flying
			flying = Type.first
			flying.should_not be_nil
			flying.name.should eql "Flying"

			flying.not_very.should include("Electric", "Rock")
		end

		it "creates flying document with correct super" do
			@builder.build_flying
			flying = Type.first
			flying.should_not be_nil
			flying.name.should eql "Flying"

			flying.super.should include("Grass", "Fighting", "Bug")
		end
	end

	describe "#build_psychic" do
		it "creates psychic document with correct not very" do
			@builder.build_psychic
			psychic = Type.first
			psychic.should_not be_nil
			psychic.name.should eql "Psychic"

			psychic.not_very.should include("Psychic", "Steel")
		end

		it "creates psychic document with correct super" do
			@builder.build_psychic
			psychic = Type.first
			psychic.should_not be_nil
			psychic.name.should eql "Psychic"

			psychic.super.should include("Fighting", "Poison")
		end

		it "creates psychic document with correct no effect" do
			@builder.build_psychic
			psychic = Type.first
			psychic.should_not be_nil
			psychic.name.should eql "Psychic"

			psychic.no_effect.should include("Dark")
		end
	end

	describe "#build_bug" do
		it "creates bug document with correct not very" do
			@builder.build_bug
			bug = Type.first
			bug.should_not be_nil
			bug.name.should eql "Bug"

			bug.not_very.should include("Fire", "Fighting", "Poison", "Flying", "Steel")
		end

		it "creates bug document with correct super" do
			@builder.build_bug
			bug = Type.first
			bug.should_not be_nil
			bug.name.should eql "Bug"

			bug.super.should include("Grass", "Psychic", "Dark")
		end
	end

	describe "#build_rock" do
		it "creates rock document with correct not very" do
			@builder.build_rock
			rock = Type.first
			rock.should_not be_nil
			rock.name.should eql "Rock"

			rock.not_very.should include("Fighting", "Ground", "Steel")
		end

		it "creates rock document with correct super" do
			@builder.build_rock
			rock = Type.first
			rock.should_not be_nil
			rock.name.should eql "Rock"

			rock.super.should include("Fire", "Ice", "Flying", "Bug")
		end
	end

	describe "#build_ghost" do
		it "creates ghost document with correct not very" do
			@builder.build_ghost
			ghost = Type.first
			ghost.should_not be_nil
			ghost.name.should eql "Ghost"

			ghost.not_very.should include("Dark", "Steel")
		end

		it "creates ghost document with correct super" do
			@builder.build_ghost
			ghost = Type.first
			ghost.should_not be_nil
			ghost.name.should eql "Ghost"

			ghost.super.should include("Psychic", "Ghost")
		end

		it "creates ghost document with correct no effect" do
			@builder.build_ghost
			ghost = Type.first
			ghost.should_not be_nil
			ghost.name.should eql "Ghost"

			ghost.no_effect.should include("Normal")
		end
	end

	describe "#build_dragon" do
		it "creates dragon document with correct not very" do
			@builder.build_dragon
			dragon = Type.first
			dragon.should_not be_nil
			dragon.name.should eql "Dragon"

			dragon.not_very.should include("Steel")
		end

		it "creates dragon document with correct super" do
			@builder.build_dragon
			dragon = Type.first
			dragon.should_not be_nil
			dragon.name.should eql "Dragon"

			dragon.super.should include("Dragon")
		end
	end

	describe "#build_dark" do
		it "creates dark document with correct not very" do
			@builder.build_dark
			dark = Type.first
			dark.should_not be_nil
			dark.name.should eql "Dark"

			dark.not_very.should include("Fighting", "Dark", "Steel")
		end

		it "creates dark document with correct super" do
			@builder.build_dark
			dark = Type.first
			dark.should_not be_nil
			dark.name.should eql "Dark"

			dark.super.should include("Psychic", "Ghost")
		end
	end

	describe "#build_steel" do
		it "creates steel document with correct not very" do
			@builder.build_steel
			steel = Type.first
			steel.should_not be_nil
			steel.name.should eql "Steel"

			steel.not_very.should include("Fire", "Water", "Electric", "Steel")
		end

		it "creates steel document with correct super" do
			@builder.build_steel
			steel = Type.first
			steel.should_not be_nil
			steel.name.should eql "Steel"

			steel.super.should include("Ice", "Rock")
		end
	end
end
