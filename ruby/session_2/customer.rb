
class Customer
	
	attr_reader :name, :account_no, :balance
	@@acc_no = 0
	
	def initialize (name)
		@name = name
		@@acc_no += 1
		@account_no = @@acc_no
		@balance = 1000
	end
	
	def deposit (amount)
		@balance += amount
	end
	
	def withdrawal (amount)
		@balance -= amount
	end

end

i = 0
cust = Array.new

while true

	puts("\n 1 : Add customer, 2 : Withdrawal, 3 : Deposit, 4 : Customer Enquiry, 0 : Exit")
	choice = gets.chomp
	
	if (choice.to_i == 1)
		puts ("\nAdd Customer:")
		print ("Enter the customer's name : ")
		name = gets.chomp
		cust[i] = Customer.new(name)
		puts ("Customer Name : #{cust[i].name}, Account Number : #{cust[i].account_no}, Starting Balance : #{cust[i].balance}")
		i += 1
		
	elsif (choice.to_i == 2)
		puts("\nWithdrawal:")
		print ("Enter Customer's account number : ")
		acc_no = gets.chomp.to_i - 1
		
		if(cust[acc_no].account_no)
			puts ("Customer's Name : #{cust[acc_no].name}, Current Balance : #{cust[acc_no].balance}")
			print ("Enter amount : ")
			amount = gets.chomp
			if(cust[acc_no].balance >= amount.to_i)
				cust[acc_no].withdrawal(amount.to_i)
				puts("Updated Balance : #{cust[acc_no].balance}")
			else
				puts ("not have enough balance")
			end	
		else
			puts("Account Number doesn't exist")
		end
		
	elsif (choice.to_i == 3)
		puts("\nDeposit:")
		print ("Enter Customer's account number : ")
		acc_no = gets.chomp.to_i - 1
		if(cust[acc_no])
			puts ("Customer's Name : #{cust[acc_no].name}, Current Balance : #{cust[acc_no].balance}")
			print ("Enter amount : ")
			amount = gets.chomp
			cust[acc_no].deposit(amount.to_i)
			puts("Updated Balance : #{cust[acc_no].balance}")
		else
			puts("Account Number doesn't exist")
		end
		
	elsif (choice.to_i == 4)
		puts("\nCustomer Enquiry:")
		print ("Enter Customer's account number : ")
		acc_no = gets.chomp.to_i - 1
		if(cust[acc_no])
			puts ("Customer's Name : #{cust[acc_no].name}, Current Balance : #{cust[acc_no].balance}")
		else
			puts("Account Number doesn't exist")
		end
		
	elsif (choice.to_i == 0)
		exit
		
	else
		puts("Invalid Entry, try again")
	end
	
end
