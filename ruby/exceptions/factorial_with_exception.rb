
def factorial
	
	begin
		puts "Enter a number for factorial"
		n = gets.chomp.to_i
		raise "Error : Number cannot be negative... retry..." if n < 0
	rescue Exception => e
		puts e.message
		retry
	end
	a = 1
	for i in 2..n do
		a = a*i
	end
	puts "the factorial of #{n} is #{a}"

end

factorial
