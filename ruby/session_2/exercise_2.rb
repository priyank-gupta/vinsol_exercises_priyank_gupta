
class Vehicle
	
	attr_reader :name
	attr_accessor :price
	
	def initialize (name, price)
		@name = name
		@price = price
	end
	
	def to_s
		puts ("Vehicle name : #{@name}\nPrice : #{@price}")
	end

end

class Bike < Vehicle
	
	attr_accessor :dealer
	
	def initialize (name, price, dealer)
		super(name, price)
		@dealer = dealer
	end
	
	def to_s
		super
		puts ("Dealer : #{@dealer}")
	end

end

bike1 = Bike.new("Pulsar", 72000, "General Motors")
puts ("\nBike name : #{bike1.name}\nPrice : #{bike1.price}\nDealer : #{bike1.dealer}")
puts("\nEnter a new price")
price = gets.chomp
bike1.price = price
puts ("\nNew price for #{bike1.name} is #{bike1.price} (Dealer : #{bike1.dealer})")

