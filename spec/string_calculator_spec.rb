require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  subject(:string_calculator) { described_class.new }

  describe '#add' do
    it '0 for an empty string' do
      expect(string_calculator.add('')).to eq 0
    end

    it "same number if contain only single element" do
      input = "1"
      expect(string_calculator.add(input)).to eq(1)
    end

    it "sum of two element 1, 5" do
      input = "1,5"
      expect(string_calculator.add(input)).to eq(6)
    end
  end
end