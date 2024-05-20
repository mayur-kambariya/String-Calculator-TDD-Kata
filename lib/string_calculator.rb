require 'pry'
class StringCalculator

  def add input_str
    @numbers = input_str
    return 0 if input_str.empty?
    numbers.reduce(:+)
  end

  private

  def numbers
    @numbers.gsub("\n", delimiter).split(delimiter).map(&:to_i)
  end

  def delimiter
    any_custom_delimiter? ? custom_delimiter : ','
  end

  def any_custom_delimiter?
    @numbers[0,2] == '//'
  end

  def custom_delimiter
    @numbers[2]
  end

end