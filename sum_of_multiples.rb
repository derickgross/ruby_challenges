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
    sum = 0

    args.each do |arg|
      multiplier = 1

      while (arg * multiplier < number)
        multiple = arg * multiplier
        sum += multiple if !multiples.include?(multiple)
        multiples.push(multiple)
        multiplier += 1
      end
    end

    sum
  end
end