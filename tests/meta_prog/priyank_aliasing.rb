
module MyModule
	
	def self.included(cls)
		cls.extend ClassMethods
	end
	
	module ClassMethods

		def chained_aliasing(meth, aliass)
			
			original_method = instance_method(meth)
			
			if public_method_defined?(meth)
				scope = "public"
			elsif protected_method_defined?(meth)
				scope = "protected"
			elsif private_method_defined?(meth)
				scope = "private"
			end
			
			if meth.to_s =~ /^[\w_]+$/
				with_meth_name = (meth.to_s + "_with_" + aliass.to_s).to_sym
				without_meth_name = (meth.to_s + "_without_" + aliass.to_s).to_sym
			else
				sym = meth[-1]
				temp_meth = meth[0,meth.length-1]
				with_meth_name = (temp_meth + "_with_" + aliass.to_s + sym).to_sym
				without_meth_name = (temp_meth + "_without_" + aliass.to_s + sym).to_sym
			end
			
			define_method(meth) do |*args, &block|
				send(with_meth_name, *args, &block)
			end
			
			define_method(without_meth_name) do |*args, &block|
				original_method.bind(self).call(*args, &block)
			end
			
			if scope == "public"
				public meth, without_meth_name, with_meth_name
			elsif scope == "protected"
				protected meth, without_meth_name, with_meth_name
			elsif scope == "private"
				private meth, without_meth_name, with_meth_name
			end
			
		end
	end
end

class Demo

	def greet(var, &block)
		puts var
		block.call
	end
	
end

class Hello < Demo
	
	include MyModule 
	
	def greet_with_logger(var, &block)
		puts '--logging start' 
		greet_without_logger(var, &block)
		puts "--logging end" 
	end
	
	chained_aliasing :greet, :logger 

end 

say = Hello.new 
say.greet("priyank") {p "hi"}
puts
say.greet_with_logger("sushant") {p "ji" }
puts
say.greet_without_logger("esha") {p "ki" }

