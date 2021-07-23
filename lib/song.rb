class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        self.name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def artist_name
        self.artist.name
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

    def self.new_by_filename(filename)
        split_filename = filename.split(/[-\.]/)
        new_song = self.new(split_filename[1].strip)
        new_song.artist_name = split_filename[0].strip
        new_song
    end
end