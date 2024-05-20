require 'pry'
class StringCalculator
  def add input_str
    return 0 if input_str.empty?
    input_str.split(/,/).map(&:to_i).reduce(:+)
  end
end