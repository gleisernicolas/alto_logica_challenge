require_relative '../lib/calculate_tax'
require_relative '../lib/line_item'

RSpec.describe LineItem do
  describe 'price_with_tax' do
    it 'calculate the tax with the CalculateTax class' do
      line_item = LineItem.new(1,  10.0, 'box of chocolates', true)

      expect(CalculateTax).to receive(:new).once.and_call_original

      line_item.price_with_tax
    end
  end

  describe 'to_s' do
    context 'for a imported line_item' do
      it 'return a descriptive string with imported' do
        line_item = LineItem.new(1, 10.0, 'box of chocolates', false)
        expected_string = '1 box of chocolates: 10.00'

        expect(line_item.to_s).to eq(expected_string)
      end
    end

    context 'for a not imported line_item' do
      it 'return a descriptive string without imported' do
        line_item = LineItem.new(1, 10.0, 'box of chocolates', true)
        expected_string = '1 imported box of chocolates: 10.50'

        expect(line_item.to_s).to eq(expected_string)
      end
    end
  end
end