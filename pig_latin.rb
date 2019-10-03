class PigLatin
  def self.translate(word)
    word.split(" ").map {|x| self.translate_word(x) }.join(" ")
  end

  private

  def self.calculate_start_index(word)
    return 3 if !["a", "e", "i", "o", "u"].include?(word[0]) && word[1..2] == "qu"
    return 2 if word[0..1] == "qu"
    return 0 if word[0..1] == "yt"
    return 0 if word[0..1] == "xr"

    i = 0

    while !["a", "e", "i", "o", "u"].include?(word[i])
      i += 1
    end

    i
  end

  def self.calculate_pig_latin_word(word, start_index)
    word[start_index..-1] + word[0...start_index] + "ay"
  end

  def self.translate_word(word)
    start_index = self.calculate_start_index(word)

    self.calculate_pig_latin_word(word, start_index)
  end
end