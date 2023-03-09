require_relative '../lib/line_item_parser'

RSpec.describe LineItemParser do
  describe 'parse' do
    context 'with valid string' do
      let(:line) { '1 imported bottle of perfume at 27.99' }
      it 'return a instance of LineItem' do
        expect(described_class.parse(line)).to be_a_instance_of(LineItem)
      end

      it 'parse the value correctly' do
        line_item = described_class.parse(line)

        expect(line_item.amount).to eq(1)
        expect(line_item.price).to eq(27.99)
        expect(line_item.name).to eq('bottle of perfume')
        expect(line_item.imported).to eq(true)
      end
    end

    context 'with a invalid string' do
      context 'without a price' do
        it 'raise InvalidPriceError' do
          line =  '1 imported bottle of perfume at '

          expect { described_class.parse(line) }.to raise_error(LineItemParser::InvalidPriceError)
        end
      end

      context 'without a name' do
        it 'raise InvalidNameError' do
          line =  '1 imported at 20.0'

          expect { described_class.parse(line) }.to raise_error(LineItemParser::InvalidNameError)
        end
      end

      context 'without a amount' do
        it 'raise InvalidAmountError' do
          line =  'imported bottle of perfume at 30.0'

          expect { described_class.parse(line) }.to raise_error(LineItemParser::InvalidAmountError)
        end
      end
    end
  end
end