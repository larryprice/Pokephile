require 'sinatra'
require 'haml'
require 'mongo'

class Pokedex < Sinatra::Base
	configure do
	  @@DB = Mongo::Connection.new.db('pokedex')
	  puts "getting db connection"
	end

	get '/' do
		haml :index
	end
end
