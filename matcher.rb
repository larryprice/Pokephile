require 'amatch'

class Matcher
	def self.closest_match(pattern, list)
		matcher = Amatch::Sellers.new(pattern)
		nearest_match = pattern
		min_score = 1.0 / 0
		list.each do |x|
			score = matcher.match(x)
			if score < min_score
				min_score = score
				nearest_match = x
			end
			break if min_score == 0
		end
		return nearest_match
	end
end