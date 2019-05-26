require 'pry'
class CashRegister

  attr_accessor :total,:discount, :last_transaction,:items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    quantity.times {@items.push title}
    @total += price * quantity
    @last_transaction = price * quantity
  end

  def apply_discount
    if discount > 0
      # @total -= (@total * (@discount.to_f / 100)).to_i
    # @total -= @total * (@discount/ 100).to_i
      @total -= @total * @discount/100
      "After the discount, the total comes to $#{@total}."
    else
   "There is no discount to apply."

 #  self.total -= self.total * discount / 100
 #  "After the discount, the total comes to $#{self.total}."
  end
  end

  def void_last_transaction
    @total -= @last_transaction
    @items.pop
  end
binding.pry

end
