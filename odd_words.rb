class OddWords
  attr_reader :processed

  def initialize(string)
    @processed = reverse_odd_words(string)
  end

  private

  def reverse_odd_words(string)
    string_parts = string.scan(/\S+/)

    i = 0
    while i < string_parts.length

      if i % 2 == 1 && string_parts[i][-1] != "."
        string_parts[i] = dag_reverse(string_parts[i])
      elsif i % 2 == 1 && string_parts[i][-1] == "."
        # string_parts[i] = string_parts[i][0..-2].reverse! + "."
        string_parts[i] = dag_reverse(string_parts[i][0..2]) + "."
      end

      i += 1
    end

    string_parts.join(" ")
  end

  def dag_reverse(string)
    i = string.length - 1
    output = ""

    while i >= 0
      output += string[i]
      i -= 1
    end

    output
  end
end

# processor = OddWords.new("whats the matter with kansas.")
# puts processor.processed