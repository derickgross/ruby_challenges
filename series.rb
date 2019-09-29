class Series
  attr_accessor :number_string

  def initialize(number_string)
    @number_string = number_string
  end

  def slices(slice_length)
    raise ArgumentError if slice_length > number_string.length
    i = 0
    output = []

    while (i <= number_string.length - slice_length)
      digits = []
      slice_length.times do |local_index|
        digits.push(number_string[i + local_index].to_i)
      end
      
      output.push(digits)
      i += 1
    end

    output
  end
end