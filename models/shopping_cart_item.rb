require_relative '../helpers/tax_calculator'

class ShoppingCartItem
  include TaxCalculator  
  attr_accessor :item, :quantity, :tax, :cost

  def initialize(item, quantity)
    calculated_tax = calculate_tax item.base_tax_candidate?, item.imported, item.shelf_price
    @item = item
    @quantity = quantity
    @tax = calculated_tax
    @cost = item.shelf_price + calculated_tax
  end

  def to_s
    '%.2f' % (cost * quantity)
  end
end