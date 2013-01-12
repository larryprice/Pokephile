require 'mongoid'

class Type
	include Mongoid::Document

	field :name, type: String
	field :super, type: Array, default: Array.new
	field :not_very, type: Array, default: Array.new
	field :no_effect, type: Array, default: Array.new
	field :weak, type: Array, default: Array.new
	field :resistant, type: Array, default: Array.new
	field :immune, type: Array, default: Array.new
end