
module ImportFile
	def import(filename)
		begin
			File.new(filename, 'r')
		rescue
			puts "\nNo such file"
			exit
		end
	end
end

def create_class(cls)
	
	eval %{class #{cls}
		extend ImportFile
		
		def initialize(arr)
			@value = arr
			@inst = self
		end
		
		def self.create_meth(filename)
			file = import(filename)
			obj = []
			file.each_line("\n") do |row|
				obj << row.chomp.split(/,/)
			end
			
			@@methds = obj[0]
			obj.shift
			person = obj.collect {|val| new(val)}
			
			class_eval do
				@@methds.each_with_index do |val, index|
					define_method(val) do
						@value[index]
					end
				end
			end
			person
		end
		self
	end}
end

#puts "Enter the filename"
filename = "Persons.csv"
fname = filename.split(/\./)
classname = fname[0]
klass = create_class(classname)
person = klass.create_meth(filename)
p person[0].name
p person[1].city
p person[2].age
