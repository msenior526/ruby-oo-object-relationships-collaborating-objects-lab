require 'pry'
class Artist
attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def self.find_or_create_by_name(name)
    if !self.find_song(name)
      self.new(name)
    else
      self.find_song(name)
    end
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

  def self.find_song(name)
      Artist.all.detect{|artist| artist.name == name}
  end
end
