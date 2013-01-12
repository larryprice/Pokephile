require_relative '../../models/type'

class TypeBuilder
	def populate
		types = create_all
		types.each do |t|
			t = set_all_defense t, types
			t.save
		end
	end

	def create_all
		types = Array.new
		methods = self.class.instance_methods.select {|m| m.to_s.include? "build_"}
		methods.each do |m|
			types << self.send(m)
		end

		types
	end

	def find_weak_defense(type_name, types)
		types.select { |t| t.super.include? type_name}
			   .map {|x| x.name}
	end

	def find_resistant_defense(type_name, types)
		types.select { |t| t.not_very.include? type_name}
			   .map {|x| x.name}
	end

	def find_immune_defense(type_name, types)
		types.select { |t| t.no_effect.include? type_name}
			   .map {|x| x.name}
	end

	def set_all_defense(type, types)
		type_name = type.name
		type.weak = find_weak_defense type_name, types
		type.resistant = find_resistant_defense type_name, types
		type.immune = find_immune_defense type_name, types
		type
	end

	def build_normal
		Type.new(:name => "Normal",
		 :not_very => ["Rock", "Steel"],
		 :no_effect => ["Ghost"])
	end

	def build_fire
		Type.new(:name => "Fire",
		 :not_very => ["Fire", "Water", "Rock", "Dragon"],
		 :super => ["Bug", "Grass", "Ice", "Steel"])
	end

	def build_water
		Type.new(:name => "Water",
		 :not_very => ["Water", "Grass", "Dragon"],
		 :super => ["Fire", "Ground", "Rock"])
	end

	def build_electric
		Type.new(:name => "Electric",
			:not_very => ["Electric", "Grass", "Dragon"],
			:no_effect => ["Ground"],
			:super => ["Water", "Flying"])
	end

	def build_grass
		Type.new(:name => "Grass",
			:not_very => ["Fire", "Grass", "Poison", "Flying", "Bug", "Dragon", "Steel"],
			:super => ["Water", "Ground", "Rock"])
	end

	def build_ice
		Type.new(:name => "Ice",
			:not_very => ["Fire", "Water", "Ice", "Steel"],
			:super => ["Grass", "Ground", "Flying", "Dragon"])
	end

	def build_fighting
		Type.new(:name => "Fighting",
			:not_very => ["Poison", "Flying", "Psychic", "Bug"],
			:super => ["Normal", "Ice", "Rock", "Dark", "Steel"],
			:no_effect => ["Ghost"])
	end

	def build_poison
		Type.new(:name => "Poison",
			:not_very => ["Poison", "Ground", "Rock", "Ghost"],
			:super => ["Grass"],
			:no_effect => ["Steel"])
	end

	def build_ground
		Type.new(:name => "Ground",
			:not_very => ["Grass", "Bug"],
			:super => ["Fire", "Electric", "Rock", "Steel", "Poison"],
			:no_effect => ["Flying"])
	end

	def build_flying
		Type.new(:name => "Flying",
			:not_very => ["Electric", "Rock", "Steel"],
			:super => ["Grass", "Fighting", "Bug"])
	end

	def build_psychic
		Type.new(:name => "Psychic",
			:not_very => ["Psychic", "Steel"],
			:super => ["Fighting", "Poison"],
			:no_effect => ["Dark"])
	end

	def build_bug
		Type.new(:name => "Bug",
			:not_very => ["Fire", "Fighting", "Poison", "Flying", "Steel", "Ghost"],
			:super => ["Grass", "Psychic", "Dark"])
	end

	def build_rock
		Type.new(:name => "Rock",
			:not_very => ["Fighting", "Ground", "Steel"],
			:super => ["Fire", "Ice", "Flying", "Bug"])
	end

	def build_ghost
		Type.new(:name => "Ghost",
			:not_very => ["Dark", "Steel"],
			:super => ["Psychic", "Ghost"],
			:no_effect => ["Normal"])
	end

	def build_dragon
		Type.new(:name => "Dragon",
			:not_very => ["Steel"],
			:super => ["Dragon"])
	end

	def build_dark
		Type.new(:name => "Dark",
			:not_very => ["Fighting", "Dark", "Steel"],
			:super => ["Psychic", "Ghost"])
	end

	def build_steel
		Type.new(:name => "Steel",
			:not_very => ["Fire", "Water", "Electric", "Steel"],
			:super => ["Ice", "Rock"])
	end
end