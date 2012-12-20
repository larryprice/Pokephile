#! /usr/bin/ruby

require './populater'
require 'mongoid'

num_pokemon = 151
env = :development

ARGV.each do |arg|
	arg_split = arg.split '='
	if arg_split[0] == 'num' && !arg_split[1].nil?
		num_pokemon = arg_split[1].to_i
	elsif arg_split[0] == 'env' && !arg_split[1].nil?
		env = ":#{arg_split[1]}"
	end
end

Mongoid.load! '../mongoid.yml', :development

puts "Adding first #{num_pokemon} Pokemon to database..."

Populater.new.add_pokemon num_pokemon
