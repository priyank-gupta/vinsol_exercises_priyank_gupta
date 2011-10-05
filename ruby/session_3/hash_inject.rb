
class Array
	
	def array_hash
		regExpStr = /\w+/
		arr = self
		hash = {}
		re_hash = {}
		re_hash["odd"] = []
		re_hash["even"] = []
		
		for i in 0...size
			
			count = 0
			if (arr[i] =~ regExpStr)
				count = arr[i].length
			else
				ar = arr[i]
				while ar != 0
					ar = ar/10
					count += 1
				end
			end
			
			if (hash[count])
				hash[count].push arr[i]
			else
				hash[count] = [arr[i]]
			end
		end
		hash.inject(0) {
		|a, el|
		if (el[0] % 2 == 0)
			re_hash["even"].push el[1]
		else
			re_hash["odd"].push  el[1]
		end
		}
		re_hash
	end
	
end

p ['abc','def',1234,234,'abcd','x','mnop',5,'zZzZ'].array_hash
