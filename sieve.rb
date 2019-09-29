class Sieve
  attr_reader :primes, :range, :number, :limit
  attr_accessor :candidates

  def initialize(number)
    @number = number
    @range = (2..number).to_a
    @limit = Math.sqrt(number)
    @candidates = get_candidates(range)
    @primes = calculate_primes(range)
  end

  def calculate_primes(range)
    i = 2
    while i < limit
      if candidates[i.to_s] == true
        j = i * i
        while j <= number
          candidates[j.to_s] = false
          j += i
        end
      end
      i += 1
    end

    candidates.select {|_, value| value }.keys.map { |prime| prime.to_i }
  end

  def get_candidates(range)
    c = {}
    range.each do |x|
      c[x.to_s] = true
    end

    c
  end
end