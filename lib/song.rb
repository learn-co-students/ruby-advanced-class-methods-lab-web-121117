
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self   #<= instance . class.all
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name_of_song)
    song = Song.new
    song.name = name_of_song
    song
  end

  def self.create_by_name(name_of_song)
    song = Song.new
    song.name = name_of_song
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end


  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song_obj| song_obj.name}
  end

  def self.new_from_filename(file_name)
    file_name.slice!(".mp3")
    file_name_array = file_name.split(" - ")
    new_song = Song.new
    new_song.artist_name = file_name_array[0]
    new_song.name = file_name_array[1]
    new_song
  end

  def self.create_from_filename(file_name)
    file_name.slice!(".mp3")
    file_name_array = file_name.split(" - ")
    new_song = Song.create
    new_song.artist_name = file_name_array[0]
    new_song.name = file_name_array[1]
    new_song
  end

  def self.destroy_all
    @@all = []
  end

end
