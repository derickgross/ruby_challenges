require 'minitest/autorun'
require_relative '../odd_words'

class OddWordsTest < Minitest::Test
  def test_reverses_odd_words
    processor = OddWords.new("whats the matter with kansas.")

    assert_equal "whats eht matter htiw kansas.", processor.processed
  end

    def test_handles_multiple_spaces_between_words
    processor = OddWords.new("whats     the    matter        with  kansas.")

    assert_equal "whats eht matter htiw kansas.", processor.processed
  end

  def test_handles_spaces_before_terminating_period
    processor = OddWords.new("whats the matter with kansas .")

    assert_equal "whats eht matter htiw kansas.", processor.processed
  end
end