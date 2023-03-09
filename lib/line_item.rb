require_relative 'calculate_tax'

class LineItem
  attr_accessor :amount, :price, :name, :imported

  def initialize(amount, price, name, imported)
    self.amount = amount
    self.price = price
    self.name = name
    self.imported = imported
  end

  def price_with_tax
    @price_with_tax ||= amount * CalculateTax.new(self).perform
  end

  def to_s
    "#{amount} #{imported ? 'imported ' : ''}#{name}: #{'%.2f' % price_with_tax}"
  end

  def cost
    price * amount
  end
end