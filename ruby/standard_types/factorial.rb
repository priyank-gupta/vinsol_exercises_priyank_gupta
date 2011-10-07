
def factorial n
	
	a = 1
	for i in 2..n do
		a = a*i
	end
	puts "the factorial of #{n} is #{a}"

end

num = gets.chomp.to_i
factorial num
