
class String

	def search str_search
	
		str = self.dup
		new_str = ""
		regExp = Regexp.new(str_search, "i")
		arr = self.scan(regExp)
		
		for i in 0..arr.length do
			match = regExp.match(str)
			if match
			new_str = new_str + "#{match.pre_match}(#{match[0]})"
			str = match.post_match.dup
			elsif i==arr.length
				new_str = new_str + str
			end
		end
		puts new_str
		puts "Total Occurences found: #{arr.length}"
	end
	
end

"Can you Can a cAn as a caNner can can a can?".search("can")
