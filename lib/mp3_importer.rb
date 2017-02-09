require 'pry'

class MP3Importer
	attr_reader :path

	def initialize(path)
		@path = path
	end
	
	def files
		Dir["#{self.path}/*.mp3"].map do |song|
			song.gsub("#{self.path}/",'')
		end
		
	end

	def import
		songs = self.files
		songs.each do |song|
			Song.new_by_filename(song)
		end
	end
	
end