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

    it "multipe number with two digit sum" do
      input = "1,5, 10, 5"
      expect(string_calculator.add(input)).to eq(21)
    end

    it "multipe number with 4 digit sum" do
      input = "1,5, 100, 500, 454"
      expect(string_calculator.add(input)).to eq(1060)
    end

    it "multipe number with 4 digit sum" do
      input = "1,\n5, 100\n500, 454, 10"
      expect(string_calculator.add(input)).to eq(1070)
    end

    it "multipe number with 4 digit sum" do
      input = "1,\n2\n3\n4\n5"
      expect(string_calculator.add(input)).to eq(15)
    end
  end
end