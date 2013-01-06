#! /usr/bin/ruby

require_relative '../../pokemon'
require 'nokogiri'
require 'open-uri'

class Populater
	def initialize()
    Pokemon.delete_all
		@data = Nokogiri::HTML(open("http://pokemon.wikia.com/wiki/List_of_Pok%C3%A9mon"))
	end

  def add_pokemon(num_to_add)
    raise "BadArgumentError" if num_to_add.nil? || !num_to_add.is_a?(Integer)
  	@data.xpath("//table[@class='wikitable sortable']/tr").each do |row|
      break if num_to_add <= 0
  		dex_num = row.at_xpath('td/text()').to_s.strip
  		next if dex_num.nil? || dex_num.empty?
  		dex_name = row.at_xpath('td[2]/a/text()').to_s.strip
      
      unless dex_num == "000"
        type_1 = row.at_xpath('td[4]/a/span/text()').to_s.strip
        type_2 = row.at_xpath('td[5]/a/span/text()').to_s.strip || row.at_xpath('td[5]/text()').to_s.strip
        image_link = "http://img.pokemondb.net/artwork/#{dex_name.downcase}.jpg"
      else
        type_1 = row.at_xpath('td[4]/text()').to_s.strip
        type_2 = row.at_xpath('td[5]/text()').to_s.strip
        image_link = "images/missingo.png"
      end

      types = Array.new
      types << type_1 unless type_1.nil? || type_1.empty?
      types << type_2 unless type_2.nil? || type_2.empty?

      Pokemon.create :number => dex_num, :name => dex_name, :types => types, :image => image_link

      num_to_add -= 1
  	end
  end
end
