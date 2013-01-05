#! /usr/bin/ruby

require_relative 'populater'
require 'mongoid'

num_pokemon = 151
env = 'development'

ARGV.each do |arg|
	arg_split = arg.split '='
	if arg_split[0] == 'num' && !arg_split[1].nil?
		num_pokemon = arg_split[1].to_i
	elsif arg_split[0] == 'env'
		if arg_split[1] == 'development' || arg_split[1] == 'test'
			env = arg_split[1]
		elsif arg_split[1] == 'production'
			if ENV['MONGOLAB_URI'].nil? || ENV['MONGOLAB_URI'].empty?
				raise "MONGOLAB_URI not defined"
			end
			env = arg_split[1]
		end
	end
end

Mongoid.load! '../mongoid.yml', env

puts "Adding first #{num_pokemon} Pokemon to #{env} database..."

Populater.new.add_pokemon num_pokemon

puts "Done!"
