
class String
	
	def to_s
		i = 0
		
		while i < self.length 
		
			if (self[i] >= "a" && self[i] <= "z")
				self[i] = self[i].upcase
			else
				self[i] = self[i].downcase
			end
			
			i += 1
		end
		self
	
	end

end

puts ("Enter a string for case inverse")
str = gets.chomp
puts("\nCase Inverse is #{str.to_s}")
puts
