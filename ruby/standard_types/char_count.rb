
class String

	def char_count
	
		count = Hash.new(0)
		for i in 0...self.length do
			case self[i]
			when '0'..'9'
				count['digits'] += 1
			when 'a'..'z'
				count['lowercase_chars'] += 1
			when 'A'..'Z'
				count['uppercase_chars'] += 1
			else
				count['special_chars'] += 1
			end
		end
		count
	end
	
end

p "Hi This is 9 nkjnv32 hvnkkjvnVGHVShkjhGG364816832kjddh412HIUH".char_count
