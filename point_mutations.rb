class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    distance = 0
    i = 0

    while i < strand.length
      break if strand[i].nil? || other_strand[i].nil?

      distance += 1 unless strand[i] == other_strand[i] 

      i += 1
    end

    distance
  end
end