
class Name

	attr_reader :first_name , :last_name
	
	def initialize (first, last)
		@first_name = first
		@last_name = last
	end
	
	def first_name=(first)
		begin
			if first == nil || first.length == 0
				raise ("Should have first name")
			end
			@first_name = first.capitalize
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

naam = Name.new("priyank","gupta")
puts naam.full_name
puts naam.first_name
puts naam.last_name
naam.first_name = nil
naam.last_name = ""

