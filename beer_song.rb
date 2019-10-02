# class BeerSong
#   def verses(start, song_end)
#     current = start
#     song = ""

#     while current >= song_end && current > 0
#       song += "\n" unless song.empty?
#       song += "#{current} #{current == 1 ? "bottle" : "bottles"} of beer on the wall, #{current} #{current == 1 ? "bottle" : "bottles"} of beer.\n"
#       song += "Take #{current == 1 ? "it" : "one"} down and pass it around, #{current - 1 == 0 ? "no more" : current - 1} #{current - 1 == 1 ? "bottle" : "bottles"} of beer on the wall.\n"

#       current -= 1
#     end

#     if current == 0 && song_end == 0
#       song += "\n" unless song.empty?
#       song += "No more bottles of beer on the wall, no more bottles of beer.\n"
#       song += "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#     end

#     song
#   end

#   def verse(start)
#     verses(start, start)
#   end

#   def lyrics
#     verses(99, 0)
#   end
# end

class BeerSong
  def verses(start, song_end)
    (song_end..start).to_a.reverse.map { |e| lookup[e].verse(e) }.join("\n")
  end

  def verse(start)
    verses(start, start)
  end

  def lyrics
    verses(99, 0)
  end

  def lookup
    [ZeroVerse.new, OneVerse.new, TwoVerse.new].concat(Array.new(97, DefaultVerse.new))
  end
end

class ZeroVerse
  def verse(number = nil)
    "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

class OneVerse
  def verse(number = nil)
    "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
  end
end

class TwoVerse
  def verse(number = nil)
    "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
  end
end

class DefaultVerse
  def verse(number)
    "#{number} bottles of beer on the wall, #{number} bottles of beer.\nTake one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
  end
end