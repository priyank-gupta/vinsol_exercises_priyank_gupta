
class String
	
	def to_s
		self.swapcase
	end
	
end

puts ("Enter a string for case inverse")
str = gets.chomp
puts("\nOutput for #{str}.to_s is #{str.to_s}")
puts
