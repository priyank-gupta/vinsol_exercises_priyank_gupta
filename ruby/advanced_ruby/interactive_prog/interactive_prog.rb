
i = 0
a = []
code = ""
begin
	a[i] = gets
	if (a[i] == "\n")
		a.each do |val|
			code += val
		end
		eval "#{code}"
		exit
	end
	i += 1
end until(a[i-1] == "q\n")
