class Genre
  attr_reader :name, :albums
  attr_accessor :id

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @albums = []
  end

  def add_item(album)
    @albums << album unless @albums.include?(album)
    album.add_genre = self
  end

  def self.list_all_genres(genres)
    puts 'No genres found, please add a new music album.' if genres.empty?
    genres.map do |genre|
      puts "+ #{genre.name}"
    end
  end
end
