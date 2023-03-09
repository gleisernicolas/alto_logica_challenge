require_relative '../lib/line_item'
require_relative '../lib/basquet'

RSpec.describe Basquet do
  describe 'add_item' do
    it 'add a new line_item to the items list' do
      line_item = LineItem.new(1,  10.0, 'box of chocolates', true)
      basquet = Basquet.new

      expect { basquet.add_item(line_item) }.to change { basquet.items.count }.by(1)
    end
  end

  describe 'total' do
    context 'without any item' do
      it 'return 0.0' do
        expect(Basquet.new.total).to eq(0.0)
      end
    end

    context 'with items' do
      it 'sums all line_items.price_with_tax' do
        double1 = double(LineItem, price_with_tax: 10.0, cost: 5)
        double2 = double(LineItem, price_with_tax: 20.0, cost: 10)
        basquet = Basquet.new

        basquet.add_item(double1)
        basquet.add_item(double2)

        expect(basquet.total).to eq(30.0)
      end
    end
  end

  describe 'sales_taxes' do
    context 'without any item' do
      it 'return 0.0' do
        expect(Basquet.new.sale_taxes).to eq(0.0)
      end
    end
  end

  context 'with items' do
    it 'return the tax amount' do
      double1 = double(LineItem, price_with_tax: 10.0, cost: 5)
      double2 = double(LineItem, price_with_tax: 20.0, cost: 10)
      basquet = Basquet.new

      basquet.add_item(double1)
      basquet.add_item(double2)

      expect(basquet.sale_taxes).to eq(15.0)
    end
  end

  describe 'to_s' do
    it 'return the descriptive of each line item with the totals' do
      double1 = double(LineItem, to_s: 'foo', price_with_tax: 10.0, cost: 5.0)
      double2 = double(LineItem, to_s: 'bar', price_with_tax: 20.0, cost: 10.0)
      basquet = Basquet.new

      basquet.add_item(double1)
      basquet.add_item(double2)

      expected_string = "foo\nbar\nSales Taxes: 15.00\nTotal: 30.00"
      expect(basquet.to_s).to eq(expected_string)
    end
  end
end
