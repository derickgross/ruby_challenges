class PerfectNumber
  def self.classify(number)
    raise RuntimeError, "Number must be positive" if number < 0

    sum = self.calculate_sum_of_factors(number)

    if sum == number
      "perfect"
    elsif sum < number
      "deficient"
    elsif sum > number
      "abundant"
    end
  end

  private

  def self.calculate_sum_of_factors(number)
    i = 1
    sum = 0

    while i <= number/2
      sum += i if number % i == 0
      i += 1
    end

    sum
  end
end