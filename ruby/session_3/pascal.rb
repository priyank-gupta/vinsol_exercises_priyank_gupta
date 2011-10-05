
def pascal n
	
	arr = []
	arr[0,2] = 1,0
	dummy = []
	puts arr[0]
	
	n.times {
	
		for i in 0..arr.length do
		
			if (i == 0)
				dummy[i] = 1
				print dummy[i].to_s + " "
			elsif (i == arr.length)
				dummy[arr.length] = 0
			else
				dummy[i] = arr[i-1] + arr[i]
				print dummy[i].to_s + " "
			end
			
		end
		
		print "\n"
		arr = dummy.dup
		
	}
	
end

pascal 6
