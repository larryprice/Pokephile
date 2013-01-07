require 'open-uri'
require 'nokogiri'
require_relative '../../pokemon'

class Parser
	def initialize
		@data = Nokogiri::HTML(open("http://pokemon.wikia.com/wiki/List_of_Pok%C3%A9mon"))
		@pokemon = Array.new
	end

	def parse(max)
		return nil if max.nil? || !max.is_a?(Integer)
		@pokemon = Array.new
		@data.xpath("//table[@class='wikitable sortable']/tr").each do |data|
      break if max <= 0

		  dex_num = data.at_xpath('td/text()').to_s.strip

			next if dex_num.nil? || dex_num.empty?

			dex_name = data.at_xpath('td[2]/a/text()').to_s.strip

	    unless dex_num == "000"
	      type_1 = data.at_xpath('td[4]/a/span/text()').to_s.strip
	      type_2 = data.at_xpath('td[5]/a/span/text()').to_s.strip || data.at_xpath('td[5]/text()').to_s.strip
	      image_link = "http://img.pokemondb.net/artwork/#{dex_name.downcase}.jpg"
	    else
	      type_1 = data.at_xpath('td[4]/text()').to_s.strip
	      type_2 = data.at_xpath('td[5]/text()').to_s.strip
	      image_link = "images/missingno.png"
	    end

	    types = Array.new
	    types << type_1 unless type_1.nil? || type_1.empty?
	    types << type_2 unless type_2.nil? || type_2.empty?

	    @pokemon << Pokemon.new(:number => dex_num, :name => dex_name, :types => types, :image => image_link)

      max -= 1
  	end

  	return @pokemon
  end

  def get_pokemon
  	@pokemon
  end
end