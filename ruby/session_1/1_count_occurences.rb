
str = gets.chomp;
i = 0;
h = {};
while i < str.length
	if ( h[str[i]] )
		h[str[i]] += 1;
	else
		h[str[i]] = 1;
	end
	i=i+1;
end

p h;
