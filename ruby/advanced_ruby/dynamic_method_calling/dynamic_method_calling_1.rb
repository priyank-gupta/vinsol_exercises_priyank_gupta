

###########################################################################################
###### By passing a value to object of Str class from command line ########################
###########################################################################################


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

puts "Create an object"
inp = gets.chomp
s = Str.new(inp)
puts "Enter the method u want to execute (exclude?(arg)/deconcat)"
s.instance_eval do
	meth = gets.chomp
	puts eval meth
end
