class Anagram
  attr_reader :sorted_word_parts, :original_word

  def initialize(word)
    @original_word = word
    @sorted_word_parts = word.downcase.split("").sort
  end

  def match(words)
    matches = []

    words.each do |word|
      matches.push(word) if (word.downcase.split("").sort == sorted_word_parts && word.downcase != original_word)
    end

    matches
  end
end