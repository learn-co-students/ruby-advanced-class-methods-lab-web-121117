require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @@all << Song.new
    @@all[-1]
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(file_name)
    hold = file_name.chomp(".mp3").split(" - ")
    new_song = Song.new_by_name(hold[1])
    new_song.artist_name = hold[0]
    new_song
  end

  def self.create_from_filename(file_name)
    hold = file_name.chomp(".mp3").split(" - ")
    Song.create_by_name(hold[1])
    self.all[-1].artist_name = hold[0]
    self.all[-1]
  end

  def self.destroy_all
    self.all.clear
  end
end
