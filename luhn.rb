class Luhn
  attr_reader :digits

  def initialize(number)
    @digits = number.to_i.to_s.split("").map(&:to_i)
  end

  def addends
    digits.reverse.map.with_index do |digit, index|
      if index % 2 == 1
        digit * 2 <= 9 ? digit * 2 : digit * 2 - 9
      else
        digit
      end
    end.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    base = Luhn.new(number * 10)

    base.valid? ? number * 10 : number * 10 + (10 - base.checksum % 10)
  end
end