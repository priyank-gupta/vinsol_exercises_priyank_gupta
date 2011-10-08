
def area (args)

	if (args.length == 1)	
		r = args[0]
		area = (22/7.to_f)*r**2
		print "area of circle is : ",area,"\n"
	
	elsif (args.length == 2)
		l, w = args[0], args[1]	
		area = l*w
		print "area of rectangle is : ",area,"\n"
	
	elsif (args.length == 3)
		a, b, c = args[0], args[1], args[2]
		s = (a+b+c)/2 
		area = Math.sqrt(s*(s-a)*(s-b)*(s-c))
		print "area of triangle is : ",area,"\n"
	
	else
		puts "wrong number of inputs"
	end
	
end

print "enter inputs (separated by commas(,)) : "
inp = gets.chomp.split(/\,/)
inp = inp.collect {|el| el.to_f}
area(inp)
