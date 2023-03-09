class Basquet
  attr_accessor :items

  def initialize()
    self.items = []
  end

  def add_item(line_item)
    items << line_item
  end

  def total
    items.sum(&:price_with_tax) || 0.0
  end

  def sale_taxes
    total - items.sum(&:cost) || 0.0
  end

  def to_s
    items_strings = items.map do |item|
                                item.to_s
                              end

    items_strings << "Sales Taxes: #{'%.2f' % sale_taxes}"
    items_strings << "Total: #{'%.2f' % total.round(2)}"

    items_strings.join("\n")
  end
end