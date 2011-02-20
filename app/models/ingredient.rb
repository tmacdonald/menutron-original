class Ingredient < ActiveRecord::Base
	validates_presence_of :name

	def self.to_fraction(decimal)
		w = self.whole_number(decimal)

		decimal -= w

		denominator = self.denominator(decimal)
		numerator = (decimal * denominator).floor

		w.to_s + " " + numerator.to_s + "/" + denominator.to_s
	end

	def self.denominator(decimal)
		result = 0
		for d in [2,3,4,5,8,10,16]
			puts (decimal * d).floor.to_s + " " + (decimal * d).to_s
			if (decimal * d).floor === (decimal * d)
				result = d
				break
			end
		end
		result
	end

	def self.whole_number(decimal)
		return decimal.floor
	end
end
