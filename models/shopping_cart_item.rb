require_relative '../helpers/tax_calculator'

class ShoppingCartItem
  include TaxCalculator  
  attr_accessor :item, :quantity, :tax, :cost

  def initialize(item, quantity)
    calculated_tax = calculate_tax(item)
    @item = item
    @quantity = quantity
    @tax = calculated_tax
    @cost = item.shelf_price + calculated_tax
  end

  def to_s
    '%.2f' % (cost * quantity)
  end
end