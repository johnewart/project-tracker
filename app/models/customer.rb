class Customer < ActiveRecord::Base
	has_many :projects
	has_many :payments
	has_many :invoices, :through => :projects

	def total
		runningtotal = 0
		projects.each do |p|
		  runningtotal += p.total
		end
		return runningtotal
	end
	
	def balance
		totalbal = 0
		projects.each do |p|
		  totalbal += p.balance
		end
		
		payments.each do |payment|
			totalbal -= payment.amount
		end
		return totalbal
	end
	
	def openinvoices 
		@open = Array.new()
		
		invoices.each do |i|
			if i.state == "U"
				@open << i
			end
		end
		
		return @open
	end
	
	def closedinvoices
		@closed = Array.new()
		
		invoices.each do |i|
			if i.state == "P"
				@closed << i
			end
		end
		
		return @closed
	end
end
