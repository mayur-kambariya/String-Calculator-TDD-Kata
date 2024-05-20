require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  subject(:string_calculator) { described_class.new }

  describe '#add' do
    context 'when input is empty or single element' do
      it 'empty string' do
        expect(string_calculator.add('')).to eq 0
      end

      it "single element" do
        input = "1"
        expect(string_calculator.add(input)).to eq(1)
      end
    end

    context 'when input has multiple elements' do
      it "1, 5" do
        input = "1,5"
        expect(string_calculator.add(input)).to eq(6)
      end

      it "two digit sum" do
        input = "1,5, 10, 5"
        expect(string_calculator.add(input)).to eq(21)
      end

      it "4 digit sum" do
        input = "1,5, 100, 500, 454"
        expect(string_calculator.add(input)).to eq(1060)
      end
    end

    context 'when input has new line' do
      it "new line single digit sum" do
        input = "1\n5,\n3,4,5"
        expect(string_calculator.add(input)).to eq(18)
      end

      it "new line with 4 digit sum" do
        input = "1,\n5, 100\n500, 454"
        expect(string_calculator.add(input)).to eq(1060)
      end
    end

    context 'when input has different delimiter' do
      it "delimiter ;" do
        input = "//;\n1;2"
        expect(string_calculator.add(input)).to eq(3)
      end

      it "delimiter -" do
        input = "//-\n1-2"
        expect(string_calculator.add(input)).to eq(3)
      end

      it "delimiter &" do
        input = "//&\n1&2"
        expect(string_calculator.add(input)).to eq(3)
      end

      it "different delimiter with multiple elements" do
        input = "//;\n1;2;3;5;9"
        expect(string_calculator.add(input)).to eq(20)
      end
    end

    context 'when input has negative numbers' do
      it "single negative number" do
        input = "-1,2"
        expect { string_calculator.add(input) }.to raise_error("Negatives not allowed: -1")
      end

      it "multiple negative number" do
        input = "1, -2, -5, \n-1,2"
        expect { string_calculator.add(input) }.to raise_error("Negatives not allowed: -2, -5, -1")
      end
    end
  end
end