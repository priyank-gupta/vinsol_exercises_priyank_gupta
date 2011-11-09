#### COMMENT - the functionality shouldnt be dependent on attr_accessor
#### attr_accessor shouldn'y be created for class by default
module MyObjectStore
	
	### Dont use constant here, constants shouldn't be modified
	
	def self.get_obj_str
		@@obj_str ||= []
	end 
	
	def self.included(cls)
		cls.extend ClassMethods
	end
	
	def method_missing(meth, *args, &block)
		meth_temp = meth.to_s.scan(/\w+/).join
		if instance_variables.include?("@#{meth_temp}".to_sym)
			self.class.attr_accessor meth_temp.to_sym 
		else
			super
		end
	end
	
	
	def save
		if self.class.instance_methods.include?(:validate)
			if validate(self)
				MyObjectStore::get_obj_str << self
			else
				puts "Object has already been saved"
			end
		else
			MyObjectStore::get_obj_str << self
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
						MyObjectStore::get_obj_str.collect {|val| a << val if (eval "val.#{meth}") == param }
						a
					end
				end
			end
			
			super
			##### Can be written as - attr_accessor *args
		end
		
		def method_missing(meth, *args, &block)
			begin
			  #### Can be written as - eval "MyObjectStore::get_obj_str.to_enum.#{meth}(*args) &block"
			  #### Using *args gives comma seperated values, using args gives array
				if args.length > 0
					eval "MyObjectStore::get_obj_str.to_enum.#{meth}(#{args.join}) &block"
				else
					eval "MyObjectStore::get_obj_str.to_enum.#{meth} &block"
				end
			rescue
				super
			end
		end
	end
end

class Play
	
	include MyObjectStore

  # attr_accessor :name, :age, :email
	
	  def initialize(name, age, email)
	    @name = name
	    @age = age
	    @email = email
	  end
	
	def validate(param)
		!MyObjectStore::get_obj_str.include?(param)
	end
	
end

p1 = Play.new("priyank", 23, "priyank.gupta@vinsol.com")
p1.name = "priyank"
p1.age = 23
p1.email = "priyank.gupta@vinsol.com"
p2 = Play.new("sushant", 22, "sushant.mittal@vinsol.com")
p2.name = "sushant"
p2.age = 22
p2.email = "sushant.mittal@vinsol.com"
p3 = Play.new("esha", 22, "esha@vinsol.com")
p3.name = "esha"
p3.age = 22
p3.email = "esha.mukhergee@vinsol.com"
p1.save
p2.save
p3.save

p Play.find_by_name("priyank")
p Play.methods.include?(:find_by_name)
p Play.find_by_age(22)
p Play.count
#p Play.asdkhf
