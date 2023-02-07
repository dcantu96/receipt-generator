require_relative '../models/item'
require_relative '../models/receipt'
require_relative '../models/shopping_cart'
require_relative '../models/shopping_cart_item'

def parse_input(input)
  shopping_cart = ShoppingCart.new
  input.each do |input_item|
    name_with_quantity, shelf_price = input_item.split(" at ")
    quantity = name_with_quantity.split(" ").first.to_i
    name = name_with_quantity.split(quantity.to_s).last.strip
    shopping_cart.add_item(ShoppingCartItem.new(Item.new(name, shelf_price.to_f), quantity.to_i))
  end
  receipt = Receipt.new(shopping_cart)
  receipt.print
end

input_1 = ["1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85"]
input_2 = ["1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50"]
input_3 = ["1 imported bottle of perfume at 27.99", "1 bottle of perfume at 18.99", "1 packet of headache pills at 9.75", "3 imported boxes of chocolates at 11.25"]


describe "A Receipt" do
  let(:input_1) { parse_input(input_1) } 
  let(:input_2) { parse_input(input_2) } 
  let(:input_3) { parse_input(input_3) } 
  context "input 1" do
    subject { parse_input(input_1) }
    it "should list the name of all the items and their price (including tax)" do
      expect(subject).to include("1 book: 12.49", "1 music CD: 16.49", "1 chocolate bar: 0.85")
      # expect(input_2).to include("1 imported box of chocolates: 10.50", "1 imported bottle of perfume: 54.65")
      # expect(input_3).to include("1 imported bottle of perfume: 32.19", "1 bottle of perfume: 20.89", "1 packet of headache pills: 9.75", "3 imported boxes of chocolates: 35.55")
    end
    it "should list the total sales taxes paid" do
      expect(subject).to include("Sales Taxes: 1.50")
    end
    it "should list the total price" do
      expect(subject).to include("Total: 29.83")
    end
  end

  context "input 2" do
    subject { parse_input(input_2) }
    it "should list the name of all the items and their price (including tax)" do
      expect(subject).to include("1 imported box of chocolates: 10.50", "1 imported bottle of perfume: 54.65")
    end
    it "should list the total sales taxes paid" do
      expect(subject).to include("Sales Taxes: 7.65")
    end
    it "should list the total price" do
      expect(subject).to include("Total: 65.15")
    end
  end

  context "input 3" do
    subject { parse_input(input_3) }
    it "should list the name of all the items and their price (including tax)" do
      expect(subject).to include("1 imported bottle of perfume: 32.19", "1 bottle of perfume: 20.89", "1 packet of headache pills: 9.75", "3 imported boxes of chocolates: 35.55")
    end
    it "should list the total sales taxes paid" do
      expect(subject).to include("Sales Taxes: 7.90")
    end
    it "should list the total price" do
      expect(subject).to include("Total: 98.38")
    end
  end
end