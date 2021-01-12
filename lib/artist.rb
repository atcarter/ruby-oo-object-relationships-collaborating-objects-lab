class Artist

    attr_accessor :name

    @@all = []


    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end


    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(string)
        obj = self.all.find {|art| art.name == string}
        if obj
            obj
        else
            obj = Artist.new(string)
            obj
        end
    end

    def print_songs
        arr = self.songs
        arr.each do |song|
            puts "#{song.name}"
        end

    end


end
