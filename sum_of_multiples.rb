class SumOfMultiples
  attr_reader :args
  attr_accessor :multiples

  def initialize(*args)
    @args = args.empty? ? [3, 5] : args
    @multiples = []
  end

  def self.to(number)
    self.new.to(number)
  end

  def to(number)
    args.each do |arg|
      multiplier = 1

      while (arg * multiplier < number)
        multiple = arg * multiplier
        multiples.push(multiple) if !multiples.include?(multiple)
        multiplier += 1
      end
    end

    multiples.sum
  end
end