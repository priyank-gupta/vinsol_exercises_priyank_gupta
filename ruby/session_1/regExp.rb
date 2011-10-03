
text = gets.chomp;
regExp = /[aeiou]/;
i=0;

while i < text.length
	if text[i] =~ regExp
		text[i] = "*";
	end
	i += 1;
end

print text + "\n";
