
arr_line = IO.readlines ("test.txt")
file = File.new("output.txt", "w")

temp = [""]
for i in 0...arr_line.length do

	switch = 1
	arr = arr_line[i].chomp.split(/\s*,\s*/)

	temp.each do |val|
		if arr[2] == val
			switch = 0
			break
		end
	end

	if switch == 1
		file.puts "\n#{arr[2]}s:"
		temp.push arr[2]

		for j in 0...arr_line.length do
			arr_temp = arr_line[j].chomp.split(/\s*,\s*/)
			file.puts "#{arr_temp[0]} (EmpId: #{arr_temp[1]})" if arr_temp[2] == arr[2]
		end

	end

end
file.close
