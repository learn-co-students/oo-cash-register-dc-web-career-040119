require "pry"
class CashRegister
  attr_accessor :total, :discount, :items, :quantity, :price

  def initialize (discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @price = price
    @items << [title] * quantity
    self.total += (price * quantity)
  end

  def apply_discount
    if self.discount !=0
      self.total *= ((100 - @discount).to_f/100)
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
  end
  end

  def items
    @items.flatten
  end

  def void_last_transaction
    @total -= @price
  end

end
