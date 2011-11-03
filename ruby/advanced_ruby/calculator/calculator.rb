### COMMENT - Can be done like this - num1.send sym, num2
### eval is not considered safe

def calculate(num1, sym, num2)
	puts eval "#{num1} #{sym} #{num2}"
end

calculate 3, :+, 4
