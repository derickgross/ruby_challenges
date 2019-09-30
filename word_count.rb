class Phrase
  attr_reader :word_count, :words

  def initialize(phrase)
    @words = (phrase.scan(/\b[\w']+\b/)).map(&:downcase)
    @word_count = count_words
  end

  def count_words
    count = {}

    words.each do |word|
      if count.key?(word)
        count[word] += 1 
      else
        count[word] = 1
      end
    end

    count
  end
end