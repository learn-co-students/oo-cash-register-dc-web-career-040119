require 'pry'

class CashRegister

	attr_accessor :total, :discount, :items, :last_transaction

	def initialize(discount = 0)
		@total = 0
		@discount = discount
		@items = []
		@last_transaction = {}
	end 

	def add_item(title, price, quantity = 1)
		quantity.times {self.items << title}
		self.total += price * quantity
		self.last_transaction = {item: title, price: price, quantity: quantity}
	end 

	def apply_discount
		if self.total != 0
			self.total *= 1 - discount / 100.00
			"After the discount, the total comes to $#{self.total.to_i}."
		else 
			"There is no discount to apply."
		end 

	end

	def void_last_transaction
    	last_transaction[:quantity].times do
      		self.total -= last_transaction[:price]
      		items.pop
    		end
	end
end
