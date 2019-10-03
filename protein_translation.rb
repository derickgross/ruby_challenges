class InvalidCodonError < StandardError; end

class Translation
  MAP = {
          "AUG" => "Methionine",
          "UUU" => "Phenylalanine",
          "UUC" => "Phenylalanine",
          "UUA" => "Leucine",
          "UUG" => "Leucine",
          "UCU" => "Serine",
          "UCC" => "Serine",
          "UCA" => "Serine",
          "UCG" => "Serine",
          "UAU" => "Tyrosine",
          "UAC" => "Tyrosine",
          "UGU" => "Cysteine",
          "UGC" => "Cysteine",
          "UGG" => "Tryptophan",
          "UAA" => "STOP",
          "UAG" => "STOP",
          "UGA" => "STOP"
        }

  def self.of_codon(codon)
    raise InvalidCodonError, "codon is invalid" unless MAP[codon]
    MAP[codon]
  end

  def self.of_rna(strand)
    start = 0
    length = 3
    proteins = []

    while start + length <= strand.length
      map_value = self.of_codon(strand.slice(start, length))
      break if map_value == "STOP"

      proteins.push(map_value)
      start += length
    end

    proteins
  end
end

# Codon Amino Acids
# AUG Methionine
# UUU, UUC  Phenylalanine
# UUA, UUG  Leucine
# UCU, UCC, UCA, UCG  Serine
# UAU, UAC  Tyrosine
# UGU, UGC  Cysteine
# UGG Tryptophan
# UAA, UAG, UGA

# {
#   "AUG" => "Methionine",
#   "UUU" => "Phenylalanine",
#   "UUC" => "Phenylalanine",
#   "UUA" => "Leucine",
#   "UUG" => "Leucine",
#   "UCU" => "Serine",
#   "UCC" => "Serine",
#   "UCA" => "Serine",
#   "UCG" => "Serine",
#   "UAU" => "Tyrosine",
#   "UAC" => "Tyrosine",
#   "UGU" => "Cysteine",
#   "UGC" => "Cysteine",
#   "UGG" => "Tryptophan",
#   "UAA" => "STOP",
#   "UAG" => "STOP",
#   "UGA" => "STOP"
# }