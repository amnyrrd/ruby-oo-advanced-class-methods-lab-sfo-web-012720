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
    song = self.new
    song.save 
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect { |song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical 
    sorted = self.all.sort_by { |s| s.name }
    sorted
  end

  def self.new_from_filename(file_name)
    split_song = file_name.split(" - ")
    artist = split_song[0]
    song_title = split_song[1].chomp(".mp3")
    song = self.new
    song.name = song_title
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file_name)
    split_song = file_name.split(" - ")
    artist = split_song[0]
    song_title = split_song[1].chomp(".mp3")
    song = self.new
    song.name = song_title
    song.artist_name = artist
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
