
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
		
		@@cls = self
		
		def self.create_meth(filename)
			file = import(filename)
			obj = []
			file.each_line("\n") do |row|
				obj << row.chomp.split(/,/)
			end
			
			@@methds = obj[0]
			obj.shift
			ghost = class << @@cls; self; end
			ghost.instance_eval do
				@@methds.each_with_index do |val, index|
					define_method(val) do
						obj.each do |value|
							puts "	\#{value[index]}"
						end
					end
				end
			end
		end
		
		def self.call_meth
			@@methds.each do |val|
				puts val.upcase
				eval %{\#{val}()}
			end
		end
		self	
	end}
	
end

#puts "Enter the filename"
filename = "Persons.csv"
fname = filename.split(/\./)
classname = fname[0]
#p classname
klass = create_class(classname)
klass.create_meth(filename)
klass.call_meth
