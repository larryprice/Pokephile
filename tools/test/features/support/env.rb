require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'mongoid'

require_relative '../../../populate/populater'

ENV['MONGOID_ENV'] = 'test'

Mongoid.load! '../../mongoid.yml'
Populater.new.populate 20

require_relative "../../../../app"

Capybara.app = Pokedex
