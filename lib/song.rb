require 'pry'

class Song
	attr_accessor :name, :artist, :genre
	def initialize(name)
		self.name = name
	end

	def self.new_by_filename(filename)
		song_info = filename.split(' - ')
		song = Song.new(song_info[1])
		song.artist = Artist.find_or_create_by_name(song_info[0])
		song.genre = song_info[2].chomp('.mp3')
		song.artist.songs << song
		song
	end
	
	
end