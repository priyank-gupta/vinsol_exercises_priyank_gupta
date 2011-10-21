module WordMatch
	def num_options
		num_opt = gets.chomp.to_i								#input number of options to enter
	end
		
	def wrong_word
		word_to_find = gets.chomp								# input the word to find
	end
	
	def options(num)
		opt = []
		for i in 0...num do
			print "#{i+1} : " 
			opt[i] = gets.chomp										#taking option strings in an array
		end
		opt
	end
end
	
module LongestCommonSubsequence
	
	def lcs(wrong_word, opt)									#method to find the longest common subsequence of two words
		m = wrong_word.length
		n = opt.length
		c = Array.new(m+1){Array.new(n+1)}			#making a two dimensional array
		for i in 0..m do
			c[i][0] = 0														#elements of first row will be zero
		end
		for j in 1..n do
			c[0][j] = 0														#elements of first column will be zero
		end
		for i in 1..m do
			for j in 1..n do
				if wrong_word[i-1] == opt[j-1]			#if the alphabets match
					c[i][j] = c[i][j-1] + 1						#add 1 to the number that is in the previous column and store that in the current field
				else
					c[i][j] = c[i][j-1] > c[i-1][j] ? c[i][j-1] : c[i-1][j]				#store the number which is larger b/w previous column and previous row in the current field
				end
			end
		end
	
		longest_subseq_length = c.max.max																		#finding the length of longest subsequence
		str = ""
		# backtracking the matched characters in the array
		for i in 0..m do
			for j in 0..n do
				if c[m-i][n-j] == longest_subseq_length && wrong_word[m-i-1] == opt[n-j-1] && longest_subseq_length > 0
					str += wrong_word[m-i-1]
					longest_subseq_length -= 1
				end
			end
		end
		str.reverse						#returning the longest subsequence string
	end
	
	def str_with_lcs(opts, subseq_length_arr)								#finding the string with longest subsequence in options array
		max_length = subseq_length_arr.max
		arr = []
		subseq_length_arr.each_with_index do |val, index|
			if val == max_length
				arr.push opts[index]
			end
		end
		arr
	end
end			
	
	
class  Dictionary
	include WordMatch
	include LongestCommonSubsequence
	
	def find_correct_word(wrong_word, opts)
		subsequence_arr = []
		opts.each_with_index do |val, index|
			subsequence_arr[index] = lcs(wrong_word, val).length							#storing the length of the longest common subsequences of each option in an array in the same index as they are
		end
		answer_arr = str_with_lcs(opts, subsequence_arr)										#array with options that has the longest common subsequence among others
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
	answer.each {|val| puts "	#{val}"}																		#printing each element separately by extracting them from array
	print "Do you want to continue (y/Y for yes): "
	choice = gets.chomp
end while (choice == 'y' || choice == 'Y')
