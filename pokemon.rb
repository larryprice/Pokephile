require 'mongoid'

class Pokemon
	include Mongoid::Document

	field :number, type: String
	field :name, type: String
	field :types, type: Array
	field :image, type: String
end
