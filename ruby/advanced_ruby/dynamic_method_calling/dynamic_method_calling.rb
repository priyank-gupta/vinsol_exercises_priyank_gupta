
#####################################################################################
###### By creating an object of Str class from command line ########################
#####################################################################################


class Str < String
	
	def initialize(str)
		super
	end
	
	def exclude?(sub_str)
		!self.include?(sub_str)
	end
	
	def deconcat
		a = self.split(/\s+/)
	end
	
end

puts "Create an object for Str: Ex:: obj = Str.new(param)"
inp = gets.chomp
obj = inp.split(/=/)
obj = obj.collect {|val| val.strip}
obj[0] = eval "#{obj[1]}"
puts "Enter the method u want to execute (exclude?(arg)/deconcat)"
obj[0].instance_eval do
	meth = gets.chomp
	puts eval meth
end
