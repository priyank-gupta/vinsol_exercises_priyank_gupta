
class Interest

	def initialize (&block)
	
		block.call(p,t)
	end
	
end

print "enter the principle amount : "
p = gets.chomp.to_f
print "enter the time : "
t = gets.chomp.to_f
i1 = Interest.new(p,t) 
		do
			|p,t|
			simple_i = p * t * 0.1
			compound_i = p * 0.1**t
			if simple_i > compound_i 
				diff = simple_i - compound_i
			else
				diff = compound_i - simple_i
			end
			print "the difference b/w simply and compoundedly calculated interest is #{diff}"
			puts
		end
