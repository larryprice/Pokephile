#! /usr/bin/ruby

require './populater.rb'

num_pokemon = ARGV.count == 0 ? 151 : ARGV.first.to_i

puts "Adding first #{num_pokemon} Pokemon to database..."

Populater.new.add_pokemon num_pokemon
