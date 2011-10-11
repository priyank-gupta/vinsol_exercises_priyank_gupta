
class Name

	attr_reader :first_name , :last_name
	
	def initialize (first, last)
		first_test first
		last_test last
	end
	
	def first_test first
		begin
			if first == nil || first.length == 0
				raise ("Should have first name")
			end
			@first_name = first.capitalize
		rescue Exception => e
			puts e.message
			exit
		end
	end
	
	def last_test last
		begin
			if last == nil || last.length == 0
				raise ("Should have last name")
			end
			@last_name = last
		rescue Exception => e
			puts e.message
			exit
		end
	end
	
	def first_name=(first)
		first_test first
	end
	
	def last_name=(last)
		last_test last
	end
	
	def full_name
		"#{@first_name} #{@last_name}"
	end

end

naam = Name.new('priyank', 'gupta')
puts naam1.full_name  
naam.first_name = 'shubham'  
puts naam.full_name 
naam.first_name = nil
naam.last_name = ""
