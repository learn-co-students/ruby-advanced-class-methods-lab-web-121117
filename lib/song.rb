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
    s = Song.new
    s.save
    s
  end

  def self.new_by_name(name)
    s = Song.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = Song.create
    s.name = name
    s
  end

  def self.find_by_name(name)
    @@all.find {|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(file_name)
    s = file_name.chomp(".mp3").split(" - ")
    new_song = Song.new_by_name(s[1])
    new_song.artist_name = s[0]
    new_song
  end

  def self.create_from_filename(file_name)
    s = file_name.chomp(".mp3").split(" - ")
    Song.create_by_name(s[1])
    self.all[-1].artist_name = s[0]
    self.all[-1]
  end

  def self.destroy_all
    self.all.clear
  end

end
