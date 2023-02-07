class Item
  attr_accessor :name, :shelf_price, :imported, :type

  def initialize(name, shelf_price)
    @name = name
    @shelf_price = shelf_price
    @imported = name.include?('imported')
    @type = name.include?('book') ? 'book' : name.include?('chocolate') ? 'food' : name.include?('pills') ? 'medical' : 'other'
  end

  def base_tax_candidate?
    type == 'other'
  end
end