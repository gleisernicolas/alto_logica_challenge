class CalculateTax
  EXEMPTIONS = ['book', 'chocolate', 'headache pill']
  attr_accessor :line_item
  
  def initialize(line_item)
    self.line_item = line_item
  end

  def perform
    return line_item.price if exempt? && !line_item.imported

    line_item.price + total_tax
  end

  def exempt?
    EXEMPTIONS.any? { |exemption| line_item.name.include?(exemption) }
  end

  def total_tax
    (((line_item.price * (tax_rate / 100.0)) * 20).ceil / 20.0)
  end

  def tax_rate
    if line_item.imported && exempt?
      5
    elsif !line_item.imported
      10
    else
      15
    end
  end
end