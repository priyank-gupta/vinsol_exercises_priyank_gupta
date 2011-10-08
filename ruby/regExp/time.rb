
def sum_time t1, t2
	
	regExp = /^([01]?[0-9]|[2][0-3])\:([0-5]?[0-9])\:([0-5]?[0-9])$/										#regular expression to validate time
	
	if t1 =~ regExp && t2 =~ regExp
	
		h1,m1,s1 = t1.split(/:/)
		h2,m2,s2 = t2.split(/:/)
	
		time1 = h1.to_i*60*60 + m1.to_i*60 + s1.to_i
		time2 = h2.to_i*60*60 + m2.to_i*60 + s2.to_i
		total_time = time1 + time2
	
		day = total_time/(24*60*60)												#to find total days
		total_time -= day*24*60*60
		h = total_time/(60*60)														#to find total hours
		total_time -= h*60*60
		m = total_time/60																	#to find total minutes
		total_time -= m*60
		s = total_time																		#to find total seconds
	
		if (day>0)
			day = "#{day.to_s} day"
			print day," & "																	#to print days
		end
	
		h = (0..9) === h ? "0#{h.to_s}" : h.to_s.dup
		m = (0..9) === m ? "0#{m.to_s}" : m.to_s.dup
		s = (0..9) === s ? "0#{s.to_s}" : s.to_s.dup
		
		time = h + ":" + m + ":" + s
		print time
		puts 
	
	else
		puts "try again... input not correct"
	end
	
end

sum_time("0:45:34","0:15:58")
sum_time("11:23:07","22:53:45")

