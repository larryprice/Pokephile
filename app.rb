require 'sinatra'
require 'haml'
require 'mongoid'
require_relative 'pokemon'

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
			@input = params[:pokemon]
			@suggestion = Pokemon.all.sort_by{rand}.first.name
		end
		haml :info
	end
end
