
class Class

	def carryover_attr(*args)
		args.each do |arg|
			
			self.class.class_eval do
			
				define_method(arg) do
					val = instance_variable_get("@#{arg}".to_sym)
					
					if !val
						value = superclass.send(arg).is_a?(Fixnum) ? superclass.send(arg) : superclass.send(arg).dup
						send("#{arg}=", value)
					else
						val
					end
				
				end
			
				define_method((arg.to_s+"=").to_sym) do |val|
					instance_variable_set("@#{arg}".to_sym, val)
				end
					
			end
		end
	end	
end

class A
	carryover_attr :a, :b
end

class B < A

end

class C < B

end

A.a = [1]
A.b = "priyank"
p A.a, A.b, B.a, B.b
B.a << 2
A.a = [2]
p "=========="
B.b = "bharat" + A.b
p A.a, B.a, B.b, A.b
C.a.push(3)
p A.a, B.a, C.a

