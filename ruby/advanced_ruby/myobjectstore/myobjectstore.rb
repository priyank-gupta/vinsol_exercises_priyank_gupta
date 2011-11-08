#### COMMENT - the functionality shouldnt be dependent on attr_accessor

module MyObjectStore
	
	### Dont use constant here, constants shouldn't be modified
	OBJ_STR = []
	
	def self.included(cls)
		cls.extend ClassMethods
	end
	
	
	def save
		if self.class.instance_methods.include?(:validate)
			if validate(self)
				MyObjectStore::OBJ_STR << self
			else
				puts "Object has already been saved"
			end
		else
			MyObjectStore::OBJ_STR << self
		end
	end
	
	
	module ClassMethods
		
		def attr_accessor(*args)
			ghost  = class << self; self; end
			### COMMENT - dont use eval
			ghost.instance_eval do
				args.each do |meth|
					meth_name = "find_by_#{meth}"
					define_method(meth_name) do |param|
						a = []
						MyObjectStore::OBJ_STR.collect {|val| a << val if (eval "val.#{meth}") == param }
						a
					end
				end
			end
			
			
			##### Can be written as - attr_accessor *args
			
			
			args.each do |meth|
				
				define_method(meth) do
					eval "@#{meth}"
				end
				define_method("#{meth}=") do |val|
					eval "@#{meth} = val"
				end
			end
		end
		
		def method_missing(meth, *args, &block)
			begin
				if args.length > 0
					eval "MyObjectStore::OBJ_STR.to_enum.#{meth}(#{args.join}) &block"
				else
					eval "MyObjectStore::OBJ_STR.to_enum.#{meth} &block"
				end
			rescue
				super
			end
		end
	end
end

class Play
	
	include MyObjectStore

  attr_accessor :name, :age, :email
	
  # def initialize(name, age, email)
  #   @name = name
  #   @age = age
  #   @email = email
  # end
	
	def validate(param)
		!MyObjectStore::OBJ_STR.include?(param)
	end
	
end

p1 = Play.new
p1.name = "priyank"
p1.age = 23
p1.email = "priyank.gupta@vinsol.com"
p2 = Play.new
p2.name = "sushant"
p2.age = 22
p2.email = "sushant.mittal@vinsol.com"
p3 = Play.new
p3.name = "esha"
p3.age = 22
p3.email = "esha.mukhergee@vinsol.com"
p1.save
p2.save
p3.save

p Play.find_by_name("priyank")
p Play.methods.include?("find_by_name")
p Play.find_by_age(22)
p Play.count
p Play.asdkhf
