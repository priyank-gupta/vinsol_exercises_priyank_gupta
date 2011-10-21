module WordMatch
	def num_options
		num_opt = gets.chomp.to_i
	end
		
	def wrong_word
		word_to_find = gets.chomp
	end
	
	def options(num)
		opt = []
		for i in 0...num do
			print "#{i+1} : " 
			opt[i] = gets.chomp
		end
		opt
	end
end
	
module LongestCommonSubstring
	
	def lcs(wrong_word, opt)
		m = wrong_word.length
		n = opt.length
		c = Array.new(m+1){Array.new(n+1)}
		for i in 0..m do
			c[i][0] = 0
		end
		for j in 1..n do
			c[0][j] = 0
		end
		for i in 1..m do
			for j in 1..n do
				if wrong_word[i-1] == opt[j-1]
					c[i][j] = c[i-1][j-1] + 1
				else
					c[i][j] =  0
				end
			end
		end
		c.flatten.max
	end
	
	def str_with_lcs(opts, substr_length_arr)
		max_length = substr_length_arr.max
		arr = []
		substr_length_arr.each_with_index do |val, index|
			if val == max_length
				arr.push opts[index]
			end
		end
		arr
	end
end			
	
	
class  Dictionary
	include WordMatch
	include LongestCommonSubstring
	
	def find_correct_word(wrong_word, opts)
		substring_arr = []
		opts.each_with_index do |val, index|
			substring_arr[index] = lcs(wrong_word, val)
		end
		answer_arr = str_with_lcs(opts, substring_arr)
	end

end

d = Dictionary.new
print "Number of options you want to enter ? "
num = d.num_options
begin
	print "Enter the wrong word : "
	wrong_word = d.wrong_word
	puts "Enter #{num} options"
	opts = d.options(num)
	answer = d.find_correct_word(wrong_word, opts)
	puts "Answer :" 
	answer.each {|val| puts "	#{val}"}
	print "Do you want to continue (y/Y for yes): "
	choice = gets.chomp
end while (choice == 'y' || choice == 'Y')
