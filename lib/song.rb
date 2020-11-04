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
    song = self.new # creates vari. song, assigns to new instance
    song.save # literally saves it
    song # returns the saved song
  end

  def self.new_by_name(song_name)
    song = self.new #  creates vari, assigns to new self
    # switch out instance id to song name
    song.name = song_name # .name retrieves songs name, assign to vari song_name
    song # returns the song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(name) # takes in a song name
    @@all.find do |song| # interates through all to find 
      song.name == name # if song.name is eq to the name we pass in our arg
    end
  end

  def self.find_or_create_by_name(name)
    # called on class method OR the other class method
    self.find_by_name(name) || self.create_by_name(name) 
  end

  def self.alphabetical
   self.all.sort_by {|song| song.name} 
   # calls song class, calls all instances, sorts by, song, song.name
  end

  def self.new_from_filename(filename)
    separate = filename.split(" - ") # create vari, holds split filename
    artist_name = separate[0] # assigns artist name to index 0
    song_name = separate[1].gsub(".mp3", "") # subs out .mp3 for nothing ("")
    song = self.new # assigns song to a new instance of a song
    song.name = song_name # assigns .name to song_name
    song.artist_name = artist_name
    song # returns new song
  end

  def self.create_from_filename(filename)
    separate = filename.split(" - ") 
    artist_name = separate[0] 
    song_name = separate[1].gsub(".mp3", "") 
    song = self.create # song calls to .create to save the new filename
    song.name = song_name 
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
