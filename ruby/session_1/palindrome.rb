
def palindrome (str)
	i = 0;
	c = 1;
	while (i < str.length/2)
		if (str[i] != str[str.length-i-1])
			c = 0;
			break;
		end
		i += 1;
	end
	if c == 1
		puts "#{str} is palindrome";
	else
		puts "#{str} is not palindrome";
	end
end


while true
	puts "\nq/Q to exit"
	choice = gets.chomp
	if (choice == "q" or choice == "Q")
		puts "Thanks, Byeee!"
		exit;
	else
	 palindrome (choice)
	end
end
