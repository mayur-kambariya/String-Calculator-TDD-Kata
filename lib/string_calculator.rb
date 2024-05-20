require 'pry'
class StringCalculator

  def add input_str
    @numbers = input_str
    return 0 if input_str.empty?
    numbers.reduce(:+)
  end

  private

  def numbers
    @numbers.gsub("\n", ',').split(',').map(&:to_i)
  end
end