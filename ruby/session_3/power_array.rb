
class Array

	def power (x)
	
		self.each_with_index do
			|el, index|
			i = 2
			while i <= x 
				self[index] = self[index] * el
				i += 1
			end
		end
		self
		
	end
	
end

p [1,2,3,4,5].power(4)
	
