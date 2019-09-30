class Trinary
  attr_reader :trinary

  def initialize(trinary_string)
    @trinary = trinary_string
  end

  def to_decimal
    trinary_parts = trinary.split("").map(&:to_i)
    decimal_value = 0
    exponent = 0

    while trinary_parts.length > 0
      value = trinary_parts.pop
      return 0 if value >= 3
      return 0 if value.to_s != trinary.reverse[exponent] # exponent corresponds to index of value in reversed original trinary string
      decimal_value += value * 3**exponent
      exponent += 1
    end

    decimal_value
  end
end