require_relative 'line_item'

class LineItemParser
  attr_accessor :line

  def self.parse(line)
    imported = line.include?('imported')

    line.gsub!('imported', '')
    line.gsub!(' at ', ' ')
    splited_line = line.split(' ')
    price = price(splited_line)
    name = splited_line[1...-1].join(' ')
    raise InvalidNameError if name.empty?

    amount = amount(splited_line)

    LineItem.new(amount, price, name, imported)
  end

  private

  def self.price(line)
    Float(line[-1])

  rescue ArgumentError

    raise InvalidPriceError
  end

  def self.amount(line)
    Integer(line.first)

  rescue ArgumentError
    raise InvalidAmountError
  end

  class InvalidPriceError < StandardError; nil end
  class InvalidNameError < StandardError; nil end
  class InvalidAmountError < StandardError; nil end
end