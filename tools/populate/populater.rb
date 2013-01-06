#! /usr/bin/ruby

require_relative '../../pokemon'
require_relative 'parser'

class Populater
	def initialize()
    @parser = Parser.new
	end

  def populate(num_to_add)
    Pokemon.delete_all
    
  	@parser.parse(num_to_add).each do |pokemon|
      unless pokemon.nil?
        pokemon.save
      end
  	end
  end
end
