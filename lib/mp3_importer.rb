require 'pry'

class MP3Importer
    attr_accessor :path
    
    def initialize(path)
        self.path = path
    end

    def files
        Dir[ "#{self.path}/*" ].select{ |f| File.file? f }.map{ |f| File.basename f }
    end

    def import
        self.files.each {|filename| Song.new_by_filename(filename)}
    end
end