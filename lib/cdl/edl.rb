module Cdl

	COLORVALUE = /(-?\d{1,}\.\d{1,})\s(-?\d{1,}\.\d{1,})\s(-?\d{1,}\.\d{1,})/
	VALUE = /\((-?\d{1}\.\d{1,}\s*-?\d{1}\.\d{1,}\s*-?\d{1}\.\d{1,})\)/
	SOP = /#{VALUE}#{VALUE}#{VALUE}/

	class Edl
	
		def initialize(file)
			@file = file
		end

		def read_file
			open_file = File.open(@file).read
			open_file.split("\r")
		end

		def to_hash
			store = []
			read_file.each do |line|
				store << {
					:slope  => $1,
					:offset => $2,
					:power  => $3
				} if line =~ SOP
			end
			store
		end

		def slope
			parse_rgb(:slope)
		end


		def offset
			parse_rgb(:offset)
		end

		def power
			parse_rgb(:power)
		end

		private

		def parse_rgb(attributes)
			
			red   = []
			green = []
			blue  = []

			to_hash.each do |r|
				red 	<< $1 if r[attributes] =~ COLORVALUE
				green << $2 if r[attributes] =~ COLORVALUE
				blue 	<< $3 if r[attributes] =~ COLORVALUE
			end
			
			result = { :red => red, :green => green, :blue => blue } 

		end

	end

end