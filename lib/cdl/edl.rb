module Cdl

	COLORVALUE = /(-?\d{1,}\.\d{1,})\s(-?\d{1,}\.\d{1,})\s(-?\d{1,}\.\d{1,})/
	VALUE = /\((-?\d{1}\.\d{1,}\s*-?\d{1}\.\d{1,}\s*-?\d{1}\.\d{1,})\)/
	SAT = /\*ASC_SAT\s*(-?\d{1}\.\d{1,})/
	SOP = /#{VALUE}#{VALUE}#{VALUE}\s*\r?/
	TAPE = /^\d{1,}\s*(\w*)\s*/
	CLIP = /^\*FROM CLIP NAME:\s*(\w*)\s*/

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
			hash  = {}
			read_file.each do |line|

				store << hash = {
					:slope  => $1, 
					:offset => $2, 
					:power  => $3 
				}	if line =~ SOP

				hash[:sat] = $1 if line =~ SAT

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

		def sat
			parse(:sat)
		end

		private

		def parse(attributes)
			arr = []
			to_hash.each do |i|
				arr << i[attributes]
			end
			arr
		end

		def parse_rgb(attributes)
			
			red   = []
			green = []
			blue  = []

			to_hash.each do |r|
				red   << $1  if r[attributes] =~ COLORVALUE
				green << $2  if r[attributes] =~ COLORVALUE
				blue  << $3  if r[attributes] =~ COLORVALUE
			end
			
			result = { :red => red, :green => green, :blue => blue } 

		end

	end

end