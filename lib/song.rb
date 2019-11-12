class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new #creates a new instance variable of the class song = Song.new
    song.save #pushes the song to the array
    song #return the song
  end

  def self.new_by_name(string_name)
     song = self.new #created a new instance
     song.name = string_name #set the name for the :name instance variable
     song #returning the instance
   end

   def self.create_by_name(string_name)
      song = self.new_by_name(string_name) #calling the new_by_name method
      song.save #saving into the @@all array
      song #returns
    end

   def self.find_by_name(string_name)
       self.all.find {|song| song.name == string_name}
   end

   def self.find_or_create_by_name(string_name)
       result = self.find_by_name(string_name)
       if !result
         self.create_by_name(string_name)
       else
          result
        end
    end

   def self.alphabetical
     self.all.sort_by {|song| song.name} #song.name goes is and grabs the name from the instance
   end
   # class method
   def self.new_from_filename(file_format)
     title_array = file_format.split(".")
     title_song = title_array[0].split(" - ")
     song_name = title_song[1]
     artist_name = title_song[0]
     song = self.new_by_name(song_name) #creates and instance / sets the name for the :name instance variable
     song.artist_name = artist_name #setting artist name to the instance variable
     song
   end

   def self.create_from_filename(file_format)
     song = self.new_from_filename(file_format)
     song.save
     song
   end

   def save #instance method
    self.class.all << self
   end

   def self.destroy_all
    self.all.clear
   end
 end
