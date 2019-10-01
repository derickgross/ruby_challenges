require 'minitest/autorun'
require_relative '../odd_words'

class OddWordsTest < Minitest::Test
  def test_reverses_odd_words
    processor = OddWords.new("whats the matter with kansas.")

    assert_equal "whats eht matter htiw kansas.", processor.processed
  end
end