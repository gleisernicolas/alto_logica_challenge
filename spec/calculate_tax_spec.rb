require_relative '../lib/calculate_tax'
require_relative '../lib/line_item'

RSpec.describe CalculateTax do
  describe 'perform' do
    context 'for a exempt line item' do
      context 'when imported' do
        it 'uses 5% tax' do
          line_item = LineItem.new(1,  10.0, 'box of chocolates', true)
          expect(described_class.new(line_item).perform).to eq(10.5)
        end
      end

      context 'when not imported' do
        it 'does not tax' do
          line_item = LineItem.new(1, 0.85, 'chocolate bar', false)

          expect(described_class.new(line_item).perform).to eq(0.85)
        end
      end
    end

    context 'for a imported not exempt line item' do
      it 'uses 15% tax' do
        line_item = LineItem.new(1,  47.50, 'bottle of perfume', true)
        expect(described_class.new(line_item).perform).to eq(54.65)
      end
    end
  end
end