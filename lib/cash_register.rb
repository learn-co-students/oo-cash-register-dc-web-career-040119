require 'pry'
class CashRegister
  attr_accessor :discount, :total, :items, :last_item

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_item = {}
  end

  def add_item(item, price, quantity = 1)
    self.total += price * quantity
    quantity.times { @items << item }
    self.last_item = { item: item, price: price, quantity: quantity }
  end

  def apply_discount
    if discount != 0
      self.total *= 1 - discount / 100.00
      self.total = self.total.round if self.total.round == self.total
      "After the discount, the total comes to $#{self.total}."
    else
      'There is no discount to apply.'
    end
  end

  def void_last_transaction
    last_item[:quantity].times do
      self.total -= last_item[:price]
      items.pop
    end

  end
end
