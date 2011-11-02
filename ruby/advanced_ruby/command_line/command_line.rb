
module DefineMethod
	def def_meth(meth)
		self.class.class_eval do
			define_method(meth) do |code|
				eval code
			end
		end
	end
end

class Command	
	extend DefineMethod
	
	def self.input
		print "Enter method name : "
		meth = gets.chomp
		print "Enter code : "
		code = gets.chomp
		def_meth(meth)
		send(meth, code)
	end
	
end

Command.input
