class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    song = self.new
    song.save
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    song.save
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    result = self.find_by_name(song_name) || result = self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    new_file = file_name.split(".").first
    artist, song_name = new_file.split(" - ")[0], new_file.split(" - ")[1]
    song = self.create_by_name(song_name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file_name)
    file = self.new_from_filename(file_name)
  end

  def self.destroy_all
    self.all.clear
  end

end
