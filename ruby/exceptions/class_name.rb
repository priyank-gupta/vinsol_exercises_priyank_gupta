
class Name

	attr_reader :first_name , :last_name
	
	def initialize (first, last)
		self.first_name = first
		self.last_name = last
	end
	
	def first_name=(first)
		begin
			if first == nil || first.length == 0
				raise ("Should have first name")
			end
			first_name = first.capitalize
			@first_name = first_name
		rescue Exception => e
			puts e.message
		end
	end
	
	def last_name=(last)
		begin
			if last == nil || last.length == 0
				raise ("Should have last name")
			end
			@last_name = last
		rescue Exception => e
			puts e.message
		end
	end
	
	def full_name
		"#{@first_name} #{@last_name}"
	end

end

naam1 = Name.new('priyank', 'gupta')
puts naam1.full_name  
naam1.first_name = 'shubham'  
puts naam1.full_name 
naam1.first_name = nil
naam1.last_name = ""
