module TaxCalculator
  def calculate_tax(is_base_tax_candidate, is_imported, shelf_price)
    tax = 0
    if is_base_tax_candidate
      rate = 0.1
      tax += round_up_tax(shelf_price, rate)
    end
    if is_imported
      rate = 0.05
      tax += round_up_tax(shelf_price, rate)
    end
    tax.round(2)
  end

  private

  def round_up_tax(shelf_price, rate)
    pre_rounded_tax = shelf_price * rate
    remainder = pre_rounded_tax % 0.10
    return pre_rounded_tax.ceil(1) if remainder > 0.05
    return pre_rounded_tax.ceil(1) - 0.05 if remainder > 0.00 
    pre_rounded_tax.floor(1)
  end
end