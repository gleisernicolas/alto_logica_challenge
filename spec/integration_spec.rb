require_relative '../scripts/run'


RSpec.describe 'Integration spec' do
  describe 'run' do
    context 'input_1' do
      it 'return the correct output' do
        file_name = 'fixtures/input_1.txt'

        expected_string = "2 book: 24.98\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 42.32"

        expect(run(file_name)).to eq(expected_string)
      end
    end

    context 'input_2' do
      it 'return the correct output' do
        file_name = 'fixtures/input_2.txt'

        expected_string = "1 imported box of chocolates: 10.50\n1 imported bottle of perfume: 54.65\nSales Taxes: 7.65\nTotal: 65.15"

        expect(run(file_name)).to eq(expected_string)
      end
    end

    context 'input_3' do
      it 'return the correct output' do
        file_name = 'fixtures/input_3.txt'

        expected_string = "1 imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 packet of headache pills: 9.75\n3 imported box of chocolates: 35.55\nSales Taxes: 7.90\nTotal: 98.38"

        expect(run(file_name)).to eq(expected_string)
      end
    end
  end
end