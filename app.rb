require 'sinatra'
require 'haml'
require 'mongoid'
require_relative 'pokemon'

class Pokedex < Sinatra::Base
	configure do
	  Mongoid.load! 'mongoid.yml'
	  puts "Count of Pokemon: #{Pokemon.count}"
	end

	get '/' do
		haml :index
	end

	post '/search' do
		haml :info
	end
end
