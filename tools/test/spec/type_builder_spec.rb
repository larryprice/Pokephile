require_relative '../../populate/type_builder'
require_relative '../../../models/type'

describe TypeBuilder do
	before:all do
		Mongoid.load! "#{File.dirname(__FILE__)}/../../../mongoid.yml", :test
	end
	before:each do
		Type.delete_all
		@builder = TypeBuilder.new
	end

	describe "#build_normal" do
		it "creates normal document with correct not very" do
			normal = @builder.build_normal
			normal.should_not be_nil
			normal.name.should eql "Normal"

			normal.not_very.count.should eql 2
			normal.not_very.should include("Rock", "Steel")
		end

		it "creates normal document with correct no effect" do
			normal = @builder.build_normal
			normal.should_not be_nil
			normal.name.should eql "Normal"

			normal.no_effect.count.should eql 1
			normal.no_effect.should include("Ghost")
		end
	end

	describe "#build_fire" do
		it "creates fire document with correct not very" do
			fire = @builder.build_fire
			fire.should_not be_nil
			fire.name.should eql "Fire"

			fire.not_very.count.should eql 4
			fire.not_very.should include("Fire", "Water", "Rock", "Dragon")
		end

		it "creates fire document with correct super" do
			fire = @builder.build_fire
			fire.should_not be_nil
			fire.name.should eql "Fire"

			fire.super.count.should eql 4
			fire.super.should include("Grass", "Ice", "Bug", "Steel")
		end
	end

	describe "#build_water" do
		it "creates water document with correct not very" do
			water = @builder.build_water
			water.should_not be_nil
			water.name.should eql "Water"

			water.not_very.count.should eql 3
			water.not_very.should include("Water", "Grass", "Dragon")
		end

		it "creates water document with correct super" do
			water = @builder.build_water
			water.should_not be_nil
			water.name.should eql "Water"

			water.super.count.should eql 3
			water.super.should include("Fire", "Ground", "Rock")
		end
	end

	describe "#build_electric" do
		it "creates electric document with correct not very" do
			electric = @builder.build_electric
			electric.should_not be_nil
			electric.name.should eql "Electric"

			electric.not_very.count.should eql 3
			electric.not_very.should include("Electric", "Grass", "Dragon")
		end

		it "creates electric document with correct no effect" do
			electric = @builder.build_electric
			electric.should_not be_nil
			electric.name.should eql "Electric"

			electric.no_effect.count.should eql 1
			electric.no_effect.should include("Ground")
		end

		it "creates electric document with correct super" do
			electric = @builder.build_electric
			electric.should_not be_nil
			electric.name.should eql "Electric"

			electric.super.count.should eql 2
			electric.super.should include("Water", "Flying")
		end
	end

	describe "#build_grass" do
		it "creates grass document with correct not very" do
			grass = @builder.build_grass
			grass.should_not be_nil
			grass.name.should eql "Grass"

			grass.not_very.count.should eql 7
			grass.not_very.should include("Fire", "Grass", "Poison", "Flying", "Bug", "Dragon", "Steel")
		end

		it "creates grass document with correct super" do
			grass = @builder.build_grass
			grass.should_not be_nil
			grass.name.should eql "Grass"

			grass.super.count.should eql 3
			grass.super.should include("Water", "Ground", "Rock")
		end
	end

	describe "#build_ice" do
		it "creates ice document with correct not very" do
			ice = @builder.build_ice
			ice.should_not be_nil
			ice.name.should eql "Ice"

			ice.not_very.count.should eql 4
			ice.not_very.should include("Fire", "Water", "Ice", "Steel")
		end

		it "creates ice document with correct super" do
			ice = @builder.build_ice
			ice.should_not be_nil
			ice.name.should eql "Ice"

			ice.super.count.should eql 4
			ice.super.should include("Grass", "Ground", "Flying", "Dragon")
		end
	end

	describe "#build_fighting" do
		it "creates fighting document with correct not very" do
			fighting = @builder.build_fighting
			fighting.should_not be_nil
			fighting.name.should eql "Fighting"

			fighting.not_very.count.should eql 4
			fighting.not_very.should include("Poison", "Flying", "Psychic", "Bug")
		end

		it "creates fighting document with correct super" do
			fighting = @builder.build_fighting
			fighting.should_not be_nil
			fighting.name.should eql "Fighting"

			fighting.super.count.should eql 5
			fighting.super.should include("Normal", "Ice", "Rock", "Dark", "Steel")
		end

		it "creates fighting document with correct no effect" do
			fighting = @builder.build_fighting
			fighting.should_not be_nil
			fighting.name.should eql "Fighting"

			fighting.no_effect.count.should eql 1
			fighting.no_effect.should include("Ghost")
		end
	end

	describe "#build_poison" do
		it "creates poison document with correct not very" do
			poison = @builder.build_poison
			poison.should_not be_nil
			poison.name.should eql "Poison"

			poison.not_very.count.should eql 4
			poison.not_very.should include("Poison", "Ground", "Rock", "Ghost")
		end

		it "creates poison document with correct super" do
			poison = @builder.build_poison
			poison.should_not be_nil
			poison.name.should eql "Poison"

			poison.super.count.should eql 1
			poison.super.should include("Grass")
		end

		it "creates poison document with correct no effect" do
			poison = @builder.build_poison
			poison.should_not be_nil
			poison.name.should eql "Poison"

			poison.no_effect.count.should eql 1
			poison.no_effect.should include("Steel")
		end
	end

	describe "#build_ground" do
		it "creates ground document with correct not very" do
			ground = @builder.build_ground
			ground.should_not be_nil
			ground.name.should eql "Ground"

			ground.not_very.count.should eql 2
			ground.not_very.should include("Grass", "Bug")
		end

		it "creates ground document with correct super" do
			ground = @builder.build_ground
			ground.should_not be_nil
			ground.name.should eql "Ground"

			ground.super.count.should eql 5
			ground.super.should include("Fire", "Electric", "Rock", "Steel", "Poison")
		end

		it "creates ground document with correct no effect" do
			ground = @builder.build_ground
			ground.should_not be_nil
			ground.name.should eql "Ground"

			ground.no_effect.count.should eql 1
			ground.no_effect.should include("Flying")
		end
	end

	describe "#build_flying" do
		it "creates flying document with correct not very" do
			flying = @builder.build_flying
			flying.should_not be_nil
			flying.name.should eql "Flying"

			flying.not_very.count.should eql 3
			flying.not_very.should include("Electric", "Rock", "Steel")
		end

		it "creates flying document with correct super" do
			flying = @builder.build_flying
			flying.should_not be_nil
			flying.name.should eql "Flying"

			flying.super.count.should eql 3
			flying.super.should include("Grass", "Fighting", "Bug")
		end
	end

	describe "#build_psychic" do
		it "creates psychic document with correct not very" do
			psychic = @builder.build_psychic
			psychic.should_not be_nil
			psychic.name.should eql "Psychic"

			psychic.not_very.count.should eql 2
			psychic.not_very.should include("Psychic", "Steel")
		end

		it "creates psychic document with correct super" do
			psychic = @builder.build_psychic
			psychic.should_not be_nil
			psychic.name.should eql "Psychic"

			psychic.super.count.should eql 2
			psychic.super.should include("Fighting", "Poison")
		end

		it "creates psychic document with correct no effect" do
			psychic = @builder.build_psychic
			psychic.should_not be_nil
			psychic.name.should eql "Psychic"

			psychic.no_effect.count.should eql 1
			psychic.no_effect.should include("Dark")
		end
	end

	describe "#build_bug" do
		it "creates bug document with correct not very" do
			bug = @builder.build_bug
			bug.should_not be_nil
			bug.name.should eql "Bug"

			bug.not_very.count.should eql 6
			bug.not_very.should include("Fire", "Fighting", "Poison", "Flying", "Steel", "Ghost")
		end

		it "creates bug document with correct super" do
			bug = @builder.build_bug
			bug.should_not be_nil
			bug.name.should eql "Bug"

			bug.super.count.should eql 3
			bug.super.should include("Grass", "Psychic", "Dark")
		end
	end

	describe "#build_rock" do
		it "creates rock document with correct not very" do
			rock = @builder.build_rock
			rock.should_not be_nil
			rock.name.should eql "Rock"

			rock.not_very.count.should eql 3
			rock.not_very.should include("Fighting", "Ground", "Steel")
		end

		it "creates rock document with correct super" do
			rock = @builder.build_rock
			rock.should_not be_nil
			rock.name.should eql "Rock"

			rock.super.count.should eql 4
			rock.super.should include("Fire", "Ice", "Flying", "Bug")
		end
	end

	describe "#build_ghost" do
		it "creates ghost document with correct not very" do
			ghost = @builder.build_ghost
			ghost.should_not be_nil
			ghost.name.should eql "Ghost"

			ghost.not_very.count.should eql 2
			ghost.not_very.should include("Dark", "Steel")
		end

		it "creates ghost document with correct super" do
			ghost = @builder.build_ghost
			ghost.should_not be_nil
			ghost.name.should eql "Ghost"

			ghost.super.count.should eql 2
			ghost.super.should include("Psychic", "Ghost")
		end

		it "creates ghost document with correct no effect" do
			ghost = @builder.build_ghost
			ghost.should_not be_nil
			ghost.name.should eql "Ghost"

			ghost.no_effect.count.should eql 1
			ghost.no_effect.should include("Normal")
		end
	end

	describe "#build_dragon" do
		it "creates dragon document with correct not very" do
			dragon = @builder.build_dragon
			dragon.should_not be_nil
			dragon.name.should eql "Dragon"

			dragon.not_very.count.should eql 1
			dragon.not_very.should include("Steel")
		end

		it "creates dragon document with correct super" do
			dragon = @builder.build_dragon
			dragon.should_not be_nil
			dragon.name.should eql "Dragon"

			dragon.super.count.should eql 1
			dragon.super.should include("Dragon")
		end
	end

	describe "#build_dark" do
		it "creates dark document with correct not very" do
			dark = @builder.build_dark
			dark.should_not be_nil
			dark.name.should eql "Dark"

			dark.not_very.count.should eql 3
			dark.not_very.should include("Fighting", "Dark", "Steel")
		end

		it "creates dark document with correct super" do
			dark = @builder.build_dark
			dark.should_not be_nil
			dark.name.should eql "Dark"

			dark.super.count.should eql 2
			dark.super.should include("Psychic", "Ghost")
		end
	end

	describe "#build_steel" do
		it "creates steel document with correct not very" do
			steel = @builder.build_steel
			steel.should_not be_nil
			steel.name.should eql "Steel"

			steel.not_very.count.should eql 4
			steel.not_very.should include("Fire", "Water", "Electric", "Steel")
		end

		it "creates steel document with correct super" do
			steel = @builder.build_steel
			steel.should_not be_nil
			steel.name.should eql "Steel"

			steel.super.count.should eql 2
			steel.super.should include("Ice", "Rock")
		end
	end

	describe "#create_all" do
		it "creates all expected types" do
			types = @builder.create_all
			types.count.should eql 17
			types.map{|x| x.name}.should include("Normal", "Water", "Fire",
																					 "Electric", "Grass", "Ice",
																					 "Fighting", "Poison", "Ground",
																					 "Flying", "Psychic", "Bug",
																					 "Rock", "Ghost", "Dragon",
																					 "Dark", "Steel")
		end
	end

	describe "#find_weak_defense" do
		it "finds weak defense for normal" do
			weak = @builder.find_weak_defense("Normal", @builder.create_all)
			weak.count.should eql 1
			weak.should include("Fighting")
		end

		it "finds weak defense for ground" do
			weak = @builder.find_weak_defense("Ground", @builder.create_all)
			weak.count.should eql 3
			weak.should include("Water", "Grass", "Ice")
		end

		it "finds weak defense for steel" do
			weak = @builder.find_weak_defense("Steel", @builder.create_all)
			weak.count.should eql 3
			weak.should include("Fire", "Fighting", "Ground")
		end
	end

	describe "#find_resistant_defense" do
		it "finds resistant defense for normal" do
			resistant = @builder.find_resistant_defense("Normal", @builder.create_all)
			resistant.count.should eql 0
		end

		it "finds resistant defense for ground" do
			resistant = @builder.find_resistant_defense("Ground", @builder.create_all)
			resistant.count.should eql 2
			resistant.should include("Poison", "Rock")
		end

		it "finds resistant defense for steel" do
			resistant = @builder.find_resistant_defense("Steel", @builder.create_all)
			resistant.count.should eql 11
			resistant.should include("Normal", "Grass", "Ice", "Flying",
											    "Psychic", "Bug", "Rock", "Dragon",
											    "Ghost", "Steel", "Dark")
		end
	end

	describe "#find_immune_defense" do
		it "finds immune defense for normal" do
			immune = @builder.find_immune_defense("Normal", @builder.create_all)
			immune.count.should eql 1
			immune.should include("Ghost")
		end

		it "finds immune defense for ground" do
			immune = @builder.find_immune_defense("Ground", @builder.create_all)
			immune.count.should eql 1
			immune.should include("Electric")
		end

		it "finds immune defense for steel" do
			immune = @builder.find_immune_defense("Steel", @builder.create_all)
			immune.count.should eql 1
			immune.should include("Poison")
		end
	end

	describe "#set_all_defense" do
		it "gets and sets all defense for fire" do
			types = @builder.create_all
			fire = @builder.set_all_defense(types.select {|x| x.name == "Fire"}.first, types)
			fire.weak.count.should eql 3
			fire.weak.should include("Ground", "Water", "Rock")
			fire.resistant.count.should eql 5
			fire.resistant.should include("Fire", "Grass", "Ice", "Bug", "Steel")
			fire.immune.count.should eql 0
		end

		it "gets and sets all defense for ghost" do
			types = @builder.create_all
			ghost = @builder.set_all_defense(types.select {|x| x.name == "Ghost"}.first, types)
			ghost.weak.count.should eql 2
			ghost.weak.should include("Ghost", "Dark")
			ghost.resistant.count.should eql 2
			ghost.resistant.should include("Poison", "Bug")
			ghost.immune.count.should eql 2
			ghost.immune.should include("Normal", "Fighting")
		end
	end

	describe "#populate" do
		it "adds all types to collection" do
			@builder.populate
			Type.count.should eql 17
			Type.all.map {|t| t.name}.should include("Normal", "Water", "Fire",
																					 		 "Electric", "Grass", "Ice",
																					     "Fighting", "Poison", "Ground",
																					     "Flying", "Psychic", "Bug",
																					     "Rock", "Ghost", "Dragon",
																					     "Dark", "Steel")
			water = Type.where(name: "Water").first
			water.weak.count.should eql 2
			water.weak.should include("Electric", "Grass")
			water.resistant.count.should eql 4
			water.resistant.should include("Fire", "Water", "Ice", "Steel")
			water.immune.count.should eql 0

			dark = Type.where(name: "Dark").first
			dark.weak.count.should eql 2
			dark.weak.should include("Fighting", "Bug")
			dark.resistant.count.should eql 2
			dark.resistant.should include("Ghost", "Dark")
			dark.immune.count.should eql 1
			dark.immune.should include("Psychic")
		end
	end
end
