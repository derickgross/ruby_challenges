class BeerSong
  def verses(start, song_end)
    current = start
    song = ""

    while current >= song_end && current > 0
      song += "\n" unless song.empty?
      song += "#{current} #{current == 1 ? "bottle" : "bottles"} of beer on the wall, #{current} #{current == 1 ? "bottle" : "bottles"} of beer.\n"
      song += "Take #{current == 1 ? "it" : "one"} down and pass it around, #{current - 1 == 0 ? "no more" : current - 1} #{current - 1 == 1 ? "bottle" : "bottles"} of beer on the wall.\n"

      current -= 1
    end

    if current == 0 && song_end == 0
      song += "\n" unless song.empty?
      song += "No more bottles of beer on the wall, no more bottles of beer.\n"
      song += "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end

    song
  end

  def verse(start)
    verses(start, start)
  end

  def lyrics
    verses(99, 0)
  end
end