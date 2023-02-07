class Receipt
  attr_accessor :shopping_cart
  
  def initialize(shopping_cart)
    @shopping_cart = shopping_cart
  end


  def calculate_total_taxes
    '%.2f' % @shopping_cart.items.inject(0) { |sum, shopping_cart_item| sum + (shopping_cart_item.tax * shopping_cart_item.quantity) }
  end

  def calculate_total_price
    '%.2f' % @shopping_cart.items.inject(0) { |sum, shopping_cart_item| sum + (shopping_cart_item.cost * shopping_cart_item.quantity) }
  end

  def print
    text = ''
    @shopping_cart.items.each do |shopping_cart_item|
      text += "#{shopping_cart_item.quantity} #{shopping_cart_item.item.name}: #{shopping_cart_item}\n"
    end
    text += "Sales Taxes: #{calculate_total_taxes}\n"
    text += "Total: #{calculate_total_price}"
  end
end