require_relative '../../models/type'

class TypeBuilder
	def build_normal
		Type.create(:name => "Normal",
		 :not_very => ["Rock", "Steel"],
		 :no_effect => ["Ghost"])
	end

	def build_fire
		Type.create(:name => "Fire",
		 :not_very => ["Fire", "Water", "Rock", "Dragon"],
		 :super => ["Bug", "Grass", "Ice", "Steel"])
	end

	def build_water
		Type.create(:name => "Water",
		 :not_very => ["Water", "Grass", "Dragon"],
		 :super => ["Fire", "Ground", "Rock"])
	end

	def build_electric
		Type.create(:name => "Electric",
			:not_very => ["Electric", "Grass", "Dragon"],
			:no_effect => ["Ground"],
			:super => ["Water", "Flying"])
	end

	def build_grass
		Type.create(:name => "Grass",
			:not_very => ["Fire", "Grass", "Poison", "Flying", "Bug", "Dragon", "Steel"],
			:super => ["Water", "Ground", "Rock"])
	end

	def build_ice
		Type.create(:name => "Ice",
			:not_very => ["Fire", "Water", "Ice", "Steel"],
			:super => ["Grass", "Ground", "Flying", "Dragon"])
	end

	def build_fighting
		Type.create(:name => "Fighting",
			:not_very => ["Poison", "Flying", "Psychic", "Bug"],
			:super => ["Normal", "Ice", "Rock", "Dark", "Steel"],
			:no_effect => ["Ghost"])
	end

	def build_poison
		Type.create(:name => "Poison",
			:not_very => ["Poison", "Ground", "Rock", "Ghost"],
			:super => ["Grass"],
			:no_effect => ["Steel"])
	end

	def build_ground
		Type.create(:name => "Ground",
			:not_very => ["Grass", "Bug"],
			:super => ["Fire", "Electric", "Fighting", "Rock", "Steel"],
			:no_effect => ["Flying"])
	end

	def build_flying
		Type.create(:name => "Flying",
			:not_very => ["Electric", "Rock"],
			:super => ["Grass", "Fighting", "Bug"])
	end

	def build_psychic
		Type.create(:name => "Psychic",
			:not_very => ["Psychic", "Steel"],
			:super => ["Fighting", "Poison"],
			:no_effect => ["Dark"])
	end

	def build_bug
		Type.create(:name => "Bug",
			:not_very => ["Fire", "Fighting", "Poison", "Flying", "Steel"],
			:super => ["Grass", "Psychic", "Dark"])
	end

	def build_rock
		Type.create(:name => "Rock",
			:not_very => ["Fighting", "Ground", "Steel"],
			:super => ["Fire", "Ice", "Flying", "Bug"])
	end

	def build_ghost
		Type.create(:name => "Ghost",
			:not_very => ["Dark", "Steel"],
			:super => ["Psychic", "Ghost"],
			:no_effect => ["Normal"])
	end

	def build_dragon
		Type.create(:name => "Dragon",
			:not_very => ["Steel"],
			:super => ["Dragon"])
	end

	def build_dark
		Type.create(:name => "Dark",
			:not_very => ["Fighting", "Dark", "Steel"],
			:super => ["Psychic", "Ghost"])
	end

	def build_steel
		Type.create(:name => "Steel",
			:not_very => ["Fire", "Water", "Electric", "Steel"],
			:super => ["Ice", "Rock"])
	end
end