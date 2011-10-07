
class String

	def rev
		
		arr_str = self.split(" ")
		str = ""
		for i in 0...arr_str.length do
			str = str + arr_str[arr_str.length-i-1]
			if (arr_str.length-1 != i)
				str = str + " "
			end
		end
		p str
		
	end
	
end

"An apple a day keeps the doctor away".rev
