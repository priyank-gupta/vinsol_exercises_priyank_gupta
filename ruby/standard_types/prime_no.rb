
def prime n
	
	2.step(n,1) {
		|i|
		count = 0
		for j in 1..Math.sqrt(i).to_i
			if (i % j == 0)
				count += 1
			end
		end
		if (count == 1)
			print i, " "
		end
	}
	puts
end

puts "Enter range for prime numbers"
num = gets.chomp.to_i
prime num
