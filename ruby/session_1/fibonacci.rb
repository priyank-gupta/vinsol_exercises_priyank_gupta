
def fib
	i = 0;
	j = 1;
	puts i;
	while j <= 1000
		yield j
		a = i;
		i = j;
		j = a + j;
	end
end

fib	{ |j| puts j}
