class MP3Importer

    attr_accessor :path

     def initialize(filename)
        @path = filename

    end

    def files
        arr = Dir.chdir(path) {|pathh|Dir.glob("*.mp3") }
        arr.map do |word|
            word[0..-5]
        end
        
        arr
    end

    def import
        self.files.each{ |filename| Song.new_by_filename(filename) }
    end
        

end
