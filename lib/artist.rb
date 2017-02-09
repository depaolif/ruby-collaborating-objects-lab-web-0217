require 'pry'

class Artist
	attr_accessor :name, :songs
	@@all = []

	def self.all
		@@all
	end

	def initialize(name)
		self.name = name
		self.songs = []
		self.save
	end

	def save
		@@all << self
	end

	def add_song(song)
		self.songs << song
	end

	def self.find_or_create_by_name(name)
		if artist = @@all.find {|artist| artist.name == name}
			artist
		else
			Artist.new(name)
		end
	end

	def print_songs
		self.songs.each	do |song|
			puts song.name
		end
	end
	
end