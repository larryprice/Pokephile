require 'open-uri'
require 'nokogiri'
require_relative '../../models/pokemon'

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

	    if dex_num == "083"
	    	image_link = "http://img.pokemondb.net/artwork/farfetchd.jpg"
	    elsif dex_num == "029"
	    	image_link = "http://img.pokemondb.net/artwork/nidoran-f.jpg"
	    elsif dex_num == "032"
	    	image_link = "http://img.pokemondb.net/artwork/nidoran-m.jpg"
	    elsif dex_num == "479"
	    	image_link = "http://img.pokemondb.net/artwork/rotom-normal.jpg"
	    elsif dex_num == "492"
	    	image_link = "http://img.pokemondb.net/artwork/shaymin-sky.jpg"
	    end

	    types = Array.new
	    types << type_1 unless type_1.nil? || type_1.empty?
	    types << type_2 unless type_2.nil? || type_2.empty?

	    if @pokemon.select {|p| p.number == dex_num}.first.nil?
		    @pokemon << Pokemon.new(:number => dex_num,
		    	                      :name => dex_name, 
		    	                      :name_lower => dex_name.downcase, 
		    	                      :types => types, 
		    	                      :image => image_link)
	      max -= 1
	    end
  	end

  	return @pokemon
  end

  def get_pokemon
  	@pokemon
  end
end