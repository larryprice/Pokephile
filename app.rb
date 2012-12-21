require 'sinatra'
require 'haml'
require 'mongoid'

class Pokedex < Sinatra::Base
	configure do
	  Mongoid.load! 'mongoid.yml'
	end

	get '/' do
		haml :index
	end
end
