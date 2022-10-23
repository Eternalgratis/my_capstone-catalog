require_relative './item'
require_relative './genre'

class MusicAlbum < Item
  attr_accessor :title, :on_spotify

  def initialize(title, publish_date, on_spotify)
    super(publish_date)
    @title = title
    @on_spotify = on_spotify
  end

  def self.list_all_albums(albums)
    if albums.empty?
      puts 'Oops! no album available '
    else
      albums.each_with_index do |album, i|
        puts "#{i}
         Title:\"#{album.title}\", Published_date:\"#{album.publish_date}\",
          Genre:\"#{album.genre.name}\",  Spotify:\"#{album.on_spotify}\" "
      end
    end
  end

  def self.create_music_album(albums, genres)
    puts 'What date was the music album published [dd/mm/yyyy]: '
    publish_date = gets.chomp
    puts 'Add title: '
    title = gets.chomp
    puts 'What type of genre is the music album: '
    g = gets.chomp
    puts 'Is the music album on spotify? [Y/N]: '
    is_on_spotify = gets.chomp
    spotify_choice = case is_on_spotify.upcase
                     when 'Y'
                       true
                     else
                       false
                     end
    genre = Genre.new(g)
    album = MusicAlbum.new(title, publish_date, spotify_choice)
    genre.add_item(album)
    albums << album
    genres << genre
    puts 'Music Album created succesfully '
  end

  def can_be_archived?
    true if super() && @on_spotify
  end
end
