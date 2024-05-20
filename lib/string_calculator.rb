class StringCalculator

  def add input_str
    @numbers = input_str
    return 0 if input_str.empty?
    error_if_negative
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

  def negatives
    numbers.select { |number| number < 0 }
  end

  def error_if_negative
    raise "Negatives not allowed: #{negatives.join(', ')}" if negatives.any?
  end
end
