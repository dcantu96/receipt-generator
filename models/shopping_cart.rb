class ShoppingCart
  attr_accessor :items

  def initialize
    @items = []
  end

  def add_item(shopping_cart_item)
    items << shopping_cart_item
  end

  def total_tax
    items.sum { |item| item.tax }
  end

  def total_cost
    items.sum { |item| item.cost }
  end
end