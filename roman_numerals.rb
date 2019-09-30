class Fixnum
  def to_roman
    roman_numeral = ""

    (self / 1000).times { roman_numeral += "M" }
    (self % 1000 / 500).times { roman_numeral += "D" }
    (self % 1000 % 500 / 100).times { roman_numeral += "C"}
    (self % 1000 % 500 % 100 / 10).times { roman_numeral += "X" }
    (self % 1000 % 500 % 100 % 10).times { roman_numeral += "I" }

    roman_numeral.sub!("CCCCC", "D")
    roman_numeral.sub!("DCCCC", "CM")
    roman_numeral.sub!("CCCC", "CD")
    roman_numeral.sub!("XXXXX", "L")
    roman_numeral.sub!("XXXX", "XL")
    roman_numeral.sub!("IIIII", "V")
    roman_numeral.sub!("IIII", "IV")
    roman_numeral.sub!("LXL", "XC")
    roman_numeral.sub!("VIV", "IX")

    roman_numeral
  end
end