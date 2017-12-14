

require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def initialize(name= nil, artist_name= nil)
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

def self.new_by_name(new_name)
  new_song = self.new ###
  new_song.name = new_name
  new_song
  # binding.pry
end

def self.create_by_name(new_name)
  # new_song = self.new_by_name(new_name)
  # new_song.save
  new_song = self.create
  new_song.name = new_name
  new_song
end

def self.find_by_name(find_name)
  all.find do |song_instance|
    song_instance.name == find_name
  end
end

def self.find_or_create_by_name(name)
  if find_by_name(name)
    find_by_name(name)
  else
    create_by_name(name)
  end
end

def self.alphabetical
  all.sort_by do |song_instance|
    song_instance.name
  end
end

def self.new_from_filename(filename)
  artist_arr = filename.split(" - ")
  filename_artist = artist_arr[0]
  filename_song = artist_arr[1].chomp(".mp3")
  new_song = self.new
  new_song.name = filename_song
  new_song.artist_name = filename_artist
  new_song
end

def self.create_from_filename(filename)
  artist_arr = filename.split(" - ")
  filename_artist = artist_arr[0]
  filename_song = artist_arr[1].chomp(".mp3")
  new_song = self.create
  new_song.name = filename_song
  new_song.artist_name = filename_artist
  new_song
end

def self.destroy_all
  all.clear
end


end
