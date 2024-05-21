class StringCalculator

  def add input_str, operator = '+'
    @numbers = input_str
    return 0 if input_str.empty?
    error_if_negative
    numbers.select { |number| number > 0 && number < 1000 }.reduce(operator.to_sym)
  end

  private

  def number_array_from_input
    @numbers.gsub("\n", delimiter).split(delimiter).map(&:to_i)
  end

  def numbers
    number_array_from_input
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

  def negatives
    numbers.select { |number| number < 0 }
  end

  def error_if_negative
    raise "Negatives not allowed: #{negatives.join(', ')}" if negatives.any?
  end
end
