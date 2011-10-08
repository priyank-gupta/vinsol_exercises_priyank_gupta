
class Interest

	def initialize (&block)
		
		@rate = 0.1
		@block = block
		
	end
	
	def diff (p,t)
	
		i_result = @block.call(p,@rate,t)
		
		if i_result[0] > i_result[1] 
			diff = i_result[0] - i_result[1]
		else
			diff = i_result[1] - i_result[0]
		end
		
		print "the difference b/w simply and compoundedly calculated interest is #{diff}"
		puts
		
	end
	
end

print "enter the principle amount : "
p = gets.chomp.to_f
print "enter the time : "
t = gets.chomp.to_f
i = Interest.new do
			|p,r,t|
			[p + (p * t * r),p*(1 + r)**t]
		end
		
i.diff(p,t)
