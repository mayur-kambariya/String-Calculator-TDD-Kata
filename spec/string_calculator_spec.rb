require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  subject(:string_calculator) { described_class.new }

  describe '#add' do
    it '0 for an empty string' do
      expect(string_calculator.add('')).to eq 0
    end
  end
end