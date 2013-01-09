require 'sinatra'
require 'haml'
require 'mongoid'
require_relative 'pokemon'
require_relative 'matcher'

class Pokedex < Sinatra::Base
	configure do
	  Mongoid.load! 'mongoid.yml'
		set :pokemon_names, Pokemon.only(:name).map {|x| x.name}
	end

	get '/' do
		haml :index
	end

	post '/search' do
		@pokemon = Pokemon.where(name_lower: params[:pokemon].downcase).first
		if @pokemon.nil?
			@bad_input = params[:pokemon]
			@suggestion = Matcher.closest_match(@bad_input, settings.pokemon_names)
		end
		haml :info
	end
end
