
def sum_time (*args)
	
	regExp = /^([01]?[0-9]|[2][0-3])\:([0-5]?[0-9])\:([0-5]?[0-9])$/										#regular expression to validate time
	total_time = 0
	
	for i in 0...args.length do
		
		if args[i] !~ regExp
			puts ("wrong input... try again")
			exit
		end
	
		h_count,m_count,s_count = args[i].split(/:/)
		total_time = total_time + h_count.to_i*60*60 + m_count.to_i*60 + s_count.to_i
	
	end
	
		day = total_time/(24*60*60)												#to find total days
		total_time -= day*24*60*60
		h = total_time/(60*60)														#to find total hours
		total_time -= h*60*60
		m = total_time/60																	#to find total minutes
		total_time -= m*60
		s = total_time																		#to find total seconds
	
		if (day>0)
			day = "#{day.to_s} days"
			print day," & "																	#to print days
		end
	
		h = (0..9) === h ? "0#{h.to_s}" : h.to_s.dup
		m = (0..9) === m ? "0#{m.to_s}" : m.to_s.dup
		s = (0..9) === s ? "0#{s.to_s}" : s.to_s.dup
		
		time = h + ":" + m + ":" + s
		print time
		puts 
	
end

sum_time("11:23:07","22:53:45","0:23:23","23:45:56")


