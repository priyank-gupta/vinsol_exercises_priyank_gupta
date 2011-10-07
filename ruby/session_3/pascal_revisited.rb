
def pascal n
	
	arr = []
	arr[0,2] = 1,0
	dummy = []
	puts arr[0]
	
	n.times {
	
		for i in 0..arr.length do
		
			if (i == 0)
				dummy[i] = 1
				yield dummy[i]
			elsif (i == arr.length)
				dummy[arr.length] = 0
			else
				dummy[i] = arr[i-1] + arr[i]
				yield dummy[i]
			end
			
		end
		
		print "\n"
		arr = dummy.dup
		
	}
	
end

pascal (6) { |el| print el.to_s + " "}
