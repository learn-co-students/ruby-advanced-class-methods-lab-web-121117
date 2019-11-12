class Song

  attr_accessor :name, :artist_name

  @@all = []

  def initialize(name=nil, artist_name=nil)
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
    @song = Song.new
    @@all << @song
    @song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
    #binding.pry
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
    #binding.pry
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name}
  end

  def self.new_from_filename(filename)
    split_filename = filename.split("-")
    raw_artist_name = split_filename[0].strip
    split_filename[1].slice! ".mp3"
    song_name = split_filename[1].strip
    new_song = self.create_by_name(song_name)
    new_song.artist_name = raw_artist_name
    #binding.pry
    new_song
  end

  def self.create_from_filename(filename)
    split_filename = filename.split("-")
    raw_artist_name = split_filename[0].strip
    split_filename[1].slice! ".mp3"
    song_name = split_filename[1].strip
    new_song = self.create_by_name(song_name)
    new_song.artist_name = raw_artist_name
    #binding.pry
    new_song
  end

  def self.destroy_all
    @@all = []
  end

end
