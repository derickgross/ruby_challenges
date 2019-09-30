class Octal
  attr_reader :octal

  def initialize(octal_string)
    @octal = octal_string
  end

  def to_decimal
    octal_parts = octal.split("").map(&:to_i)
    decimal_value = 0
    exponent = 0

    while octal_parts.length > 0
      value = octal_parts.pop
      return 0 if value >= 8
      return 0 if value.to_s != octal.reverse[exponent] # exponent corresponds to index of value in reversed original octal string
      decimal_value += value * 8**exponent
      exponent += 1
    end

    decimal_value
  end
end