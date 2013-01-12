require 'sinatra'
require 'haml'
require 'mongoid'
require_relative 'models/pokemon'
require_relative 'models/type'
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
		else
			get_weaks_and_resistants
		end
		haml :info
	end

	def get_weaks_and_resistants
		@resistants = get_resistants @pokemon.types
		@weaks = get_weaks @pokemon.types
		@immunes = get_immunes @pokemon.types
		@resistants.uniq!
		@weaks.uniq!
		@immunes.uniq!
		deletes = Array.new
		@resistants.each do |r|
			if @weaks.include?(r) || @immunes.include?(r)
				deletes << r
			end
		end
		deletes.each do |d|
			@resistants.delete d
			@weaks.delete d
		end

		deletes.clear
		@weaks.each do |w|
			if @immunes.include? w
				deletes << w
			end
		end
		deletes.each do |d|
			@weaks.delete d
		end
	end

	def get_resistants(types)
		resistants = Array.new
		types.each do |t|
			Type.where(name: t).first.resistant.each do |s|
				resistants << s
			end
		end
		resistants
	end

	def get_weaks(types)
		weaks = Array.new
		types.each do |t|
			Type.where(name: t).first.weak.each do |s|
				weaks << s
			end
		end
		weaks
	end

	def get_immunes(types)
		immunes = Array.new
		types.each do |t|
			Type.where(name: t).first.immune.each do |i|
				immunes << i
			end
		end
		immunes
	end

	def stringify_types_list(list)
		str = ""
		(0...list.count).each do |i|
			str << list.at(i)
			str << ', ' unless i == list.count - 1
		end
		str
	end
end
