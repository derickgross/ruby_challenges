class Sieve
  attr_reader :primes, :number, :limit
  attr_accessor :candidates

  def initialize(number)
    @number = number
    @limit = Math.sqrt(number)
    @candidates = get_candidates
    @primes = calculate_primes
  end

  def calculate_primes
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

  def get_candidates
    c = {}
    (2..number).to_a.each do |x|
      c[x.to_s] = true
    end

    c
  end
end