#! /usr/bin/ruby

require_relative '../../pokemon'
require 'nokogiri'
require 'open-uri'

class Populater
	def initialize()
    Pokemon.delete_all

		@data = []
		load_data
	end

	def load_data
    @data = Nokogiri::HTML(open("http://pokemon.wikia.com/wiki/List_of_Pok%C3%A9mon"))
  end

  def add_pokemon(num_pokemon)
  	num = format_string num_pokemon
    return if num == "000"
  	@data.xpath("//table[@class='wikitable sortable']/tr").each do |row|
  		dex_num = row.at_xpath('td/text()').to_s.strip
  		next if dex_num.nil? || dex_num.empty?
  		dex_name = row.at_xpath('td[2]/a/text()').to_s.strip
      
      unless dex_num == "000"
        type_1 = row.at_xpath('td[4]/a/span/text()').to_s.strip
        type_2 = row.at_xpath('td[5]/a/span/text()').to_s.strip || row.at_xpath('td[5]/text()').to_s.strip
        image_link = "http://img.pokemondb.net/artwork/#{dex_name}.jpg"
      else
        type_1 = row.at_xpath('td[4]/text()').to_s.strip
        type_2 = row.at_xpath('td[5]/text()').to_s.strip
        image_link = "images/missingo.png"
      end

      types = Array.new
      types << type_1 unless type_1.nil? || type_1.empty?
      types << type_2 unless type_2.nil? || type_2.empty?

      monster = Pokemon.new :number => dex_num, :name => dex_name, :types => types, :image => image_link
      monster.save

      #@pokemon.insert({:number => dex_num, :name => dex_name, :types => types, :image => image_link})
  		break if dex_num.to_i == num.to_i - 1
  	end
  end

  def format_string(num)
    if num.nil? || !num.kind_of?(Integer)
      raise ArgumentError
    end

    str_num = num.to_s
    case str_num.size
    when 3
      str_num
    when 2
      "0#{str_num}"
    when 1
      "00#{str_num}"
    when 0
      "000"
    else
      "999"
    end
  end
end
